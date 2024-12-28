{
  containers.audiobooks = {
    autoStart = true;
    bindMounts = {
      "/var/lib/audiobookshelf" = {
        hostPath = "/mnt/sdb1/media/audiobooks";
        isReadOnly = false;
      };
    };

    config =
      { pkgs, ... }:
      {
        services = {
          audiobookshelf = {
            enable = true;
            # port = 8000;
            # host = "audiobooks.alpine-centauri.ts.net";
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
