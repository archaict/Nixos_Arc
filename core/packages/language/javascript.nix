{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    nodejs
    bun
    # nodePackages.mermaid-cli
    # plantuml
    # plantuml-server
    # pandoc-plantuml-filter
  ];
}
