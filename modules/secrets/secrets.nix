let
  Mac-von-Jan = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPTpgedzJ7vs3GMOjUeQGkAzGhNZRhvMMz9Z1whaWieE";
  galanthus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIZYQao2OKQxyic+I327VZ7lQECh9hSS9cgsls3e/a1u";
  all = [
    Mac-von-Jan
    galanthus
  ];
in
{
  "nextcloud.age".publicKeys = all;
  "forgejo-runner-token.age".publicKeys = all;
}
