{
  containers.immich = {
    autoStart = true;

    bindMounts = {
      "/var/lib/immich" = {
        hostPath = "/mnt/sdb1/photos";
        isReadOnly = false;
      };
    };

    config = {
      services = {
        immich = {
          enable = true;
          host = "immich.alpine-centauri.ts.net";
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
