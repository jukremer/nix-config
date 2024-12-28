{ lib, ... }:
{
  containers.minecraft = {
    autoStart = true;

    bindMounts = {
      "/var/lib/minecraft" = {
        hostPath = "/mnt/sdb1/minecraft";
        isReadOnly = false;
      };
    };

    config = {
      nixpkgs.config.allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "minecraft-server"
        ];

      services = {
        minecraft-server = {
          enable = true;
          eula = true;
        };

        tailscale = {
          enable = true;
          useRoutingFeatures = "server";
          interfaceName = "userspace-networking";
        };
      };

      system.stateVersion = "24.05";
    };
  };
}
