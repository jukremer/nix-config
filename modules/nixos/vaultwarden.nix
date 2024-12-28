{
  containers.vault = {
    autoStart = true;
    bindMounts = {
      "/var/backup/vaultwarden" = {
        hostPath = "/mnt/sdb1/vaultwarden";
        isReadOnly = false;
      };
    };

    config = {
      services = {
        vaultwarden = {
          enable = true;
          backupDir = "/var/backup/vaultwarden";
          dbBackend = "postgresql";
          config = {
            # SIGNUPS_ALLOWED = false;
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
