{ config, lib, pkgs, ... }:

{
  time.timeZone = "UTC";

  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [
    vim
    git
    curl
    htop
  ];

  networking.firewall.allowedTCPPorts = [ 22 ];

  system.stateVersion = "24.11";
}
