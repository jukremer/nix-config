{ inputs, ... }:
{
  containers.nextcloud = {
    autoStart = true;
    bindMounts = {
      "/etc/ssh/ssh_host_ed25519_key".hostPath = "/etc/ssh/ssh_host_ed25519_key";
      "/var/lib/nextcloud/data" = {
        hostPath = "/mnt/sdb1/data";
        isReadOnly = false;
      };
    };

    config =
      { pkgs, config, ... }:
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age = {
          identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
          secrets."nextcloud" = {
            file = ../secrets/nextcloud.age;
            mode = "400";
            owner = "nextcloud";
          };
        };

        services = {
          nextcloud = {
            enable = true;
            package = pkgs.nextcloud30;
            hostName = "nextcloud";
            https = true;
            config = {
              adminpassFile = config.age.secrets.nextcloud.path;
            };
            settings = {
              trusted_domains = [ "nextcloud.alpine-centauri.ts.net" ];
              enabledPreviewProviders = [
                "OC\\Preview\\AVI"
                "OC\\Preview\\BMP"
                "OC\\Preview\\GIF"
                "OC\\Preview\\HEIC"
                "OC\\Preview\\JPEG"
                "OC\\Preview\\Krita"
                "OC\\Preview\\MKV"
                "OC\\Preview\\MP3"
                "OC\\Preview\\MP4"
                "OC\\Preview\\MarkDown"
                "OC\\Preview\\Movie"
                "OC\\Preview\\OpenDocument"
                "OC\\Preview\\PDF"
                "OC\\Preview\\PNG"
                "OC\\Preview\\TXT"
                "OC\\Preview\\XBitmap"
              ];
            };

            database.createLocally = true;
            configureRedis = true;

            maxUploadSize = "1G";

            ## Set up non-declaratively for now
            # extraAppsEnable = true;
            # autoUpdateApps.enable = true;
            # extraApps = {
            #   inherit (config.services.nextcloud.package.packages.apps)
            #     news
            #     contacts
            #     calendar
            #     tasks
            #     ;
            # };
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
