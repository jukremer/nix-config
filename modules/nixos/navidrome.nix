{
  containers.music = {
    autoStart = true;
    bindMounts = {
      "/Music" = {
        hostPath = "/mnt/sdb1/media/Music";
        isReadOnly = false;
      };
    };

    config = {
      services = {
        navidrome = {
          enable = true;
          settings = {
            MusicFolder = "/Music";
            port = 4533;
          };
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
