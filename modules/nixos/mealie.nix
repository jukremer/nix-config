{
  containers.mealie = {
    autoStart = true;

    config = {
      services = {
        mealie = {
          enable = true;
          port = 9000;
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
