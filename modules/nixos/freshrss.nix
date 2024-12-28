{
  containers.freshrss = {
    autoStart = true;

    config = {
      services = {
        freshrss = {
          enable = true;
          language = "de";
          authType = "none";
          baseUrl = "https://freshrss.alpine-centauri.ts.net";
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
