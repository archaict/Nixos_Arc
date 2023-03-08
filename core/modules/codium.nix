{ config, lib, pkgs, ... }:

{

  programs.vscode = {
    # package =
    # # https://github.com/VanCoding/nix-vscode-extension-manager#installation
    # (pkgs.vscode-with-extensions.override {
    #   vscode = pkgs.vscodium;
    #   vscodeExtensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace
    #     (builtins.fromJSON (builtins.readFile ../../codex/core/codium/vscode-extensions.json));
    # }).overrideAttrs (oldAttrs: rec {
    #   pname = pkgs.vscode.pname;
    # });

    enable = false;
    package = pkgs.vscodium;
    # userSettings = ''
    #   {
    #     "update.channel"="none";
    #     "[nix]"."editor.tabSize"=2;
    #   }
    # '';

    extensions = with pkgs.vscode-extensions; [

      # Nix Extensions
      bbenoist.nix
      brettm12345.nixfmt-vscode
      jnoortheen.nix-ide
      arrterian.nix-env-selector
      foam.foam-vscode
      bradlc.vscode-tailwindcss
      dbaeumer.vscode-eslint

      bodil.file-browser

      redhat.java
      kahole.magit
      vscodevim.vim
      edonet.vscode-command-runner

      usernamehw.errorlens
      pkief.material-icon-theme
      ms-vscode.cpptools

    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [

      # Themes
      {
        name = "tokyo-night";
        publisher = "enkia";
        version = "0.8.4";
        sha256 = "sha256-h4mE+Vv/o2MxkNb3kT9gLeDNCGQ5AvyR5nsi3cEUS5U=";
      }

      # Web Development
      {
        name = "html-snippets";
        publisher = "abusaidm";
        version = "0.2.1";
        sha256 = "sha256-mps1lMruuA6cb4kae0J3bMNJPb1uIQAb7jjy9aDn2Oc=";
      }

      # File Utils
      {
        name = "vscode-ripgrep";
        publisher = "bokuweb";
        version = "0.2.1";
        sha256 = "sha256-mYViPlLC/5jAwd/9JWaQPoDKCB7I/0KxnRlsIrMtEIQ=";
      }
      {
        name = "vscode-powertools";
        publisher = "egomobile";
        version = "0.67.1";
        sha256 = "sha256-tjGFRUfKgYPBOz+okYy208QGghs0+R6HxnlLRTUjFoc=";
      }
      {
        name = "projectile";
        publisher = "hackartist";
        version = "0.1.2";
        sha256 = "sha256-iX4oyYlWNtbwJkYJyDxHPOGLQXuGMrBKFwiRFWzM7uE=";
      }
      {
        name = "vscode-fileutils";
        publisher = "sleistner";
        version = "3.4.2";
        sha256 = "sha256-ct0PYxSoyfsH58dZN3y4BGHpNlXzF2sOZVWlHWtTefA=";
      }

      {
        name = "datetime";
        publisher = "rid9";
        version = "2.1.4";
        sha256 = "sha256-faATVaXQOieKm2vnlQrPdLDbTsKCVfuIqQP8vd2TIW4=";
      }

      {
        name = "autoimport";
        publisher = "steoates";
        version = "1.5.3";
        sha256 = "sha256-0YVC20YonZtGjxuV5Vd1yorryGKvQoH7muXAO4MLofY=";
      }

      {
        name = "parameter-hints";
        publisher = "DominicVonk";
        version = "0.2.7";
        sha256 = "sha256-Ri4GYwfrmeFcWTD6HisZcZ99wG/qfFeH2IykWiVGtUM=";
      }

      # Vim

      {
        name = "viml";
        publisher = "xadillax";
        version = "2.1.2";
        sha256 = "sha256-n91Rj1Rpp7j7gndkt0bV+jT1nRMv7+coVoSL5c7Ii3A=";
      }

      {
        name = "laravel-artisan";
        publisher = "ryannaddy";
        version = "0.0.28";
        sha256 = "sha256-hyZqJhI1ru06wsPCjV1SyFU9cdt1Gp4Ad/jnWVu3Yt8=";
      }

      {
        publisher = "wwm";
        name = "better-align";
        sha256 = "909262fb423f6426d698b47cceb84c00b6342f010c30cefff098f6a4b6babbd1";
        version = "1.1.6";
      }
      {
        publisher = "onecentlin";
        name = "laravel5-snippets";
        sha256 = "e18e6bbb6c0764141b87b5f74ade91e118b52dd70ca580fb5806c527b8781153";
        version = "1.15.0";
      }
      {
        publisher = "vscjava";
        name = "vscode-java-debug";
        sha256 = "fda3fef053caad23e02718bfb1246ba768552d2d6300d156d0748d16dbf53bd2";
        version = "0.41.2022053107";
      }
      {
        publisher = "vscjava";
        name = "vscode-java-dependency";
        sha256 = "0fd07db12ae18fe2b758b1e2079ba9fbb6cc7a1780482fe5f37368566646b2c1";
        version = "0.19.2022052500";
      }
      {
        publisher = "vscjava";
        name = "vscode-java-pack";
        sha256 = "d879ae8694b980c3a9b3169fba49bba5c827aed9bb6b10666c9c04bdeb143a5d";
        version = "0.23.2022060200";
      }
      {
        publisher = "vscjava";
        name = "vscode-java-test";
        sha256 = "df447a02db1f2b08e3ee0858dd3daa758970e9a63e70ca3f95cd6a2a0b72220d";
        version = "0.35.2022051902";
      }
      {
        publisher = "vscjava";
        name = "vscode-maven";
        sha256 = "23e4f8ec37ebdd311d50262d01dc2c3038d7266a33dbdb6b886dc5bb484e4f85";
        version = "0.35.2022053103";
      }
      {
        publisher = "jamesottaway";
        name = "nix-develop";
        sha256 = "95d0fdd3bb293c2807435d17a6169101b82435c61dcc00aa50eaf609fe68f335";
        version = "0.0.1";
      }
      {
        publisher = "matt-rudge";
        name = "auto-open-preview-panel";
        sha256 = "e6c5c7571df1b3571bdf1e6cf93cd308716b5aabc7bc8f74a2f807c1905e6cb5";
        version = "0.0.6";
      }
      {
        publisher = "mblode";
        name = "zotero";
        sha256 = "5f096f549d20311feb37796065c85452107899593b5fab9c7da49a7e72c29451";
        version = "0.1.10";
      }
      {
        publisher = "mkhl";
        name = "direnv";
        sha256 = "e7f4eaa67ffb6f297ecf60137e580a575fab85daa3f9730464d6c6c03986c0b4";
        version = "0.6.1";
      }
      {
        publisher = "mpty";
        name = "pack-arduino";
        sha256 = "a8ded135c3ef052ec93842d392b1eda2e14eddbf1cdddb2b3cf6cf19211828f3";
        version = "0.1.0";
      }
      {
        publisher = "pinage404";
        name = "nix-extension-pack";
        sha256 = "77bde66e0bff137bb1f67c12142930f0af5ac84f7ab34bf8882e2e5faea0ce9c";
        version = "2.0.0";
      }
      {
        publisher = "redhat";
        name = "vscode-yaml";
        sha256 = "6cdb6a4b862d8b45892324bbb921ec400680efbcc015cea72ab8827bbdba72ad";
        version = "1.7.0";
      }
      {
        publisher = "rlivings39";
        name = "fzf-quick-open";
        sha256 = "4e19228b22c3eb2cb705ba7cbf0837d2ed7e9aabfc9d2fb6de91778d29bc77f4";
        version = "0.4.7";
      }
      {
        publisher = "rvest";
        name = "vs-code-prettier-eslint";
        sha256 = "1fcc4cee6eaf08e698f02f615734b1a1be7f8a908df33b5495eb0cb2ea72d352";
        version = "5.0.1";
      }
      {
        publisher = "SeoJunYoo";
        name = "react-component-preview";
        sha256 = "8f887f18022b38b18db173f6cc53e484353acbd4e63098856584ed03b5fc75b6";
        version = "1.0.5";
      }
      {
        publisher = "tht13";
        name = "html-preview-vscode";
        sha256 = "db609e469fe9cf452270c82871f9a47784e4a3d02f73de8947d8c9ffe28ee54c";
        version = "0.2.5";
      }
      {
        publisher = "Tomi";
        name = "xajssnippets";
        sha256 = "5b33cb5e2282fb22bf134253dd5f1bcd84c4fa6cd3397771471f0357ffe058ec";
        version = "1.2.0";
      }
      {
        publisher = "Tomi";
        name = "xasnippets";
        sha256 = "eb44759de221d9e54edd2b10cae51fc6ee502830223a1009483040f60bfb057f";
        version = "2.13.1";
      }
      {
        publisher = "ZainChen";
        name = "json";
        sha256 = "9c2dd0f0ab82b67fe38358ff35a031586be729eff292b3e6d8f5237ec273f1a2";
        version = "2.0.2";
      }
      {
        publisher = "slbtty";
        name = "lisp-syntax";
        sha256 = "268b3430906e1656dfc802bfc39d7eadb96c94dabea4737c825d53d3f51c3f44";
        version = "0.2.1";
      }
      {
        publisher = "wwm";
        name = "better-align";
        sha256 = "909262fb423f6426d698b47cceb84c00b6342f010c30cefff098f6a4b6babbd1";
        version = "1.1.6";
      }
      {
        publisher = "formulahendry";
        name = "auto-rename-tag";
        sha256 = "b97a9679bc670f069454b146e8c521e1b67b8f0e5ddab4c7466e4da11da7d15b";
        version = "0.1.10";
      }
      {
        publisher = "yatki";
        name = "vscode-surround";
        sha256 = "3c93b9373dad96556a16276cb6dc298b42366bb623826e3458836779e7890ded";
        version = "1.3.0";
      }
      {
        publisher = "ms-vscode";
        name = "live-server";
        sha256 = "e2b373f2eec57f9653905fb8f8e72b84efe8f40aa2df06b949d4ca906860b044";
        version = "0.2.12";
      }
      {
        publisher = "amiralizadeh9480";
        name = "laravel-extra-intellisense";
        sha256 = "6d97d37725336894b9782b67fc4692d3df0aff9d4c27a1fd9817f9f8fc8ffe36";
        version = "0.6.2";
      }
      {
        publisher = "ipatalas";
        name = "vscode-postfix-ts";
        sha256 = "57ac24b98d8cd4e004fbd5a9cc1b3eef24429fa614fdcc015caac85cca5d90c0";
        version = "1.10.0";
      }
      {
        publisher = "ryannaddy";
        name = "laravel-artisan";
        sha256 = "87266a261235aeed3ac2c3c28d5d52c8553d71db751a9e0077f8e7595bb762df";
        version = "0.0.28";
      }
      {
        publisher = "zenclabs";
        name = "previewjs";
        sha256 = "892202e2237ec5fd9c18e38b8304b08c628db71a81cadb16a72e598db6812b05";
        version = "1.8.0";
      }
      {
        publisher = "dsznajder";
        name = "es7-react-js-snippets";
        sha256 = "405f79d0986f5486ad840ca0bdadf0c143b304b8c19bb1c4dd281ca7b7f6d0f7";
        version = "4.4.3";
      }
      {
        publisher = "evilz";
        name = "vscode-reveal";
        sha256 = "21b46afc889219816a775503ba1282599bfde0e5323b0e0858fbedf25296ebc7";
        version = "4.1.3";
      }
      {
        publisher = "robole";
        name = "markdown-snippets";
        sha256 = "584c92a5bd7906f6df5b814498abed273e13110f8e93f635ca548733973df98c";
        version = "0.7.5";
      }
      {
        publisher= "rrudi";
        name = "vscode-dired";
        sha256 = "045a1663a69c578363b3e6b72a1920cce3d536eca83be116c58c073b34e03424";
        version = "0.0.6";
      }
      {
        publisher= "haskell";
        name= "haskell";
        sha256= "6063f2b662383e01fa190b96691179aae88a1a839a6e4bfb3a7f9656ea48f761";
        version= "2.2.0";
      }
      # {
      #   publisher= "dlasagno";
      #   name= "wal-theme";
      #   sha256= "5f5e8de4294d54bb56493eb8c9b254108468e968030b338384103d49c007239c";
      #   version= "2.2.0";
      # }
      {
        publisher= "mutantdino";
        name= "resourcemonitor";
        version= "1.0.7";
        sha256= "cf1875b2b7be79a90a495d1d097530b44fcd3452b2e8c8613fa0331cd050b80d";
      }
      {
        publisher= "ms-vscode-remote";
        name= "remote-ssh";
        sha256= "2447211ad097a3040280b9cadbf44877ffb0eb0f9060d0965154af5b9331b6c4";
        version= "0.81.2022060215";
      }
      {
        publisher= "DeepInThought";
        name= "vscode-shell-snippets";
        sha256= "6668af19c4fdf168b2fa7e28a9091620dadfb329c9a650995ca9d292917f352a";
        version= "0.3.1";
      }
      {
        publisher= "fabiospampinato";
        name= "vscode-todo-plus";
        sha256= "75a28c78550f6526a7ac5bbd27a9a4dd9566973f1966ab996b7a9a5924db4a3b";
        version= "4.18.4";
      }
      {
        publisher= "platformio";
        name= "platformio-ide";
        sha256= "909f2ad9c192ba3907fa9920156fbc44c3b7f21fbbb8b1646920ae5d863ac9ef";
        version= "2.5.0";
      }

    ];

  };

}
