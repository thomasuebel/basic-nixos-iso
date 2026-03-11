{ config, lib, ... }:

let
  keyFile = ../authorized-keys;
in
{
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "prohibit-password";
      PasswordAuthentication = false;
    };
  };

  users.users.root.openssh.authorizedKeys.keyFiles =
    lib.optional (builtins.pathExists keyFile) keyFile;
}
