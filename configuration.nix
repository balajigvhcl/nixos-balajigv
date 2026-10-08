{ config, pkgs, modulesPath, ... }:

{
  imports = [
    ./hardware-configuration.nix
    "${modulesPath}/virtualisation/amazon-image.nix"
  ];

  ec2.hvm = true;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    git
    htop
    apacheHttpd
  ];

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "prohibit-password";
  services.httpd.enable = true;
  # ✅ Put nix settings inside an attribute set
  nix.settings = {
    max-jobs = 1;
    cores = 1;
    substituters = [ "https://cache.nixos.org/" ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };


  users.users.balaji = {
    isNormalUser = true;
    description = "Balaji Admin User";
    home = "/home/balaji";
    extraGroups = [ "wheel" "networkmanager" ]; # wheel = sudo access
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
    #  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQ..." # your public key
    ];
  };

  # Optional: set default password (not recommended for production)
    users.users.balaji.initialPassword = "changeme";



}
