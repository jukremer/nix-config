{
  virtualisation.oci-containers = {
    containers = {
      pinchflat = {
        image = "ghcr.io/kieraneglin/pinchflat:latest";
        environment.TZ = "Europe/Berlin";
        ports = [ "127.0.0.1:8945:8945" ];
        volumes = [
          "/mnt/sdb1/media/youtube/config:/config"
          "/mnt/sdb1/media/youtube/downloads:/downloads"
        ];
      };
    };
  };

  containers.youtube = {
    autoStart = true;

    config = {
      services = {
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
