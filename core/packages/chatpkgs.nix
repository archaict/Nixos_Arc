{ pkgs, ... }:

{

  # Chat
  environment.systemPackages = with pkgs; [
    whatsapp-for-linux
    franz 
    # rambox
  ];

}
