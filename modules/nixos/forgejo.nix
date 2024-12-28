{ inputs, ... }:
{
  containers.git = {
    autoStart = true;
    bindMounts."/etc/ssh/ssh_host_ed25519_key".hostPath = "/etc/ssh/ssh_host_ed25519_key";

    config = {
      imports = [ inputs.agenix.nixosModules.default ];

      age = {
        identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
        secrets."forgejo-runner-token" = {
          file = ../secrets/forgejo-runner-token.age;
          mode = "400";
          owner = "forgejo";
        };
      };

      services = {
        forgejo = {
          enable = true;
          database.type = "postgres";
          lfs.enable = true;
          settings = {
            server = {
              DOMAIN = "git.alpine-centauri.ts.net";
              ROOT_URL = "https://git.alpine-centauri.ts.net/";
              HTTP_PORT = 3000;
            };
            actions = {
              ENABLED = true;
              DEFAULT_ACTIONS_URL = "https://code.forgejo.org";
            };
          };
        };

        # gitea-actions-runner = {
        #   package = pkgs.forgejo-runner;
        #   instances.native = {
        #     enable = true;
        #     name = "native";
        #     url = "https://git.alpine-centauri.ts.net";
        #     tokenFile = config.age.secrets.forgejo-runner-token.path;
        #     labels = [ "native:host" ];
        #   };
        # };

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
