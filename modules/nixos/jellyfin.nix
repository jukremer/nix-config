{
  containers.jellyfin = {
    autoStart = true;
    bindMounts = {
      "/media" = {
        hostPath = "/mnt/sdb1/media";
        isReadOnly = false;
      };
    };

    config =
      { pkgs, ... }:
      {
        services = {
          jellyfin = {
            enable = true; # port = 8096
            openFirewall = true;
          };

          tailscale = {
            enable = true;
            useRoutingFeatures = "server";
            interfaceName = "userspace-networking";
          };
        };

        environment.systemPackages = with pkgs; [
          jellyfin
          jellyfin-web
          jellyfin-ffmpeg
        ];

        ## Hardware transcoding
        nixpkgs.config.packageOverrides = pkgs: {
          vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
        };
        hardware.graphics = {
          enable = true;
          extraPackages = with pkgs; [
            intel-media-driver
            intel-vaapi-driver # previously vaapiIntel
            vaapiVdpau
            intel-compute-runtime # OpenCL filter support (hardware tonemapping and subtitle burn-in)
            # vpl-gpu-rt # QSV on 11th gen or newer
            intel-media-sdk # QSV up to 11th gen
          ];
        };

        ## Grab EPG data daily
        systemd = {
          services.epg = {
            script = "${pkgs.nodejs_18}/bin/npm run --prefix /media/TV/epg/ grab -- --channels=custom.channels.xml";
            path = [
              pkgs.bash
              pkgs.nodejs_18
            ];
            serviceConfig = {
              Type = "oneshot";
              User = "root";
            };
            startAt = "daily"; # Creates a timer
          };
          timers.epg.timerConfig.Persistent = true;
        };

        system.stateVersion = "24.05";
      };
  };
}
