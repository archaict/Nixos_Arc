{
  description = "Arkiv Configuration Files";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-22.11";
    nixos.url = "nixpkgs/release-22.11";
    hyprland.url = "github:hyprwm/Hyprland";

    nur.url = "github:nix-community/NUR/7ac4d082947310f87f9ed65084b5844ade9c9e5a";
    flake-utils.url = "github:numtide/flake-utils/flatten-tree-system";
    devshell.url = "github:numtide/devshell";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    qtscrcpy.url = "github:NixOS/nixpkgs/d896f0d8e02d3a251e595761807eb9656a221685";
    emacs-overlay.url = "github:nix-community/emacs-overlay/55a555f10b76f1e632a429dc6b9d10b81fa86023";
    nvem.url = "github:VanCoding/nix-vscode-extension-manager/2fc2d11f940c22c4b13a8b59c6ec3ad9c8a7e7b8";

    grub2-themes.url = github:vinceliuice/grub2-themes;
    grub2-themes.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    home-manager = {
      url = "github:nix-community/home-manager/2dce7f1a55e785a22d61668516df62899278c9e4";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ci-agent.url = "github:hercules-ci/hercules-ci-agent";
    # picom-jonaburg = { url = "github:jonaburg/picom"; flake = false; };
    # picom-pijulius = { url = "github:pijulius/picom/ee4dd3dde3afa089ea525dec3f7f3edc6adf6de7"; flake = false; };
    picom-pijulius = { url = "github:dccsillag/picom/51b21355696add83f39ccdb8dd82ff5009ba0ae5"; flake = false; };

  };

  outputs = { self, nixpkgs, home-manager, nixos, nur, flake-utils, grub2-themes
    , emacs-overlay, devshell, nixos-hardware, ci-agent, picom-pijulius, hyprland
    , nvem , unstable, plasma-manager, ... }@inputs:

    {

      nixosConfigurations."nixos-laptop" = inputs.nixpkgs.lib.nixosSystem {

        system = "x86_64-linux";

        modules = [

          ./configuration.nix
          home-manager.nixosModules.home-manager

          hyprland.nixosModules.default

          # hyprland.homeManagerModules.default
          # {wayland.windowManager.hyprland.enable = true;}

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.archaict.imports = [
              ./home.nix
              inputs.plasma-manager.homeManagerModules.plasma-manager
            ];
          }

          {
            nix.registry.nixpkgs.flake = inputs.nixpkgs;
            nixpkgs.overlays = [
              # (import ./overlays { unstable = unstable; })
              inputs.nur.overlay
              # inputs.neovim.overlay
              inputs.emacs-overlay.overlay

              #(final: prev: {
              #  unstable-kde = import inputs.unstable-kde {
              #    system = "x86_64-linux";
              #    config.allowUnfree = true;
              #  };
              #})
              (final: prev: {
                unstable = import inputs.unstable {
                  system = "x86_64-linux";
                  config.allowUnfree = true;
                };
              })

              (final: prev: {
                uns-qtscrcpy = import inputs.qtscrcpy {
                  system = "x86_64-linux";
                  # config.allowUnfree = true;
                };
              })

              # (final: prev: {
              #   picom-jonaburg = prev.picom.overrideAttrs
              #     (_: { src = inputs.picom-jonaburg; });
              #   })
              (final: prev: {
                picom-pijulius = prev.picom.overrideAttrs
                  (_: { src = inputs.picom-pijulius; });
                })
              # (final: prev: {
              #   vscode-unstable = prev.vscode.overrideAttrs
              #     (_: { src = inputs.vscode-unstable; });
              #   })

            ];
          }

        ];
        specialArgs = { inherit inputs; };

      };

    };
}
