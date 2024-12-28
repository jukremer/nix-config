{
  services.samba = {
    enable = true;

    settings = {
      global = {
        "vfs objects" = "catia fruit streams_xattr";
        "guest account" = "jan";
        "fruit:model" = "MacPro7,1@ECOLOR=226,226,224";
      };

      Media = {
        path = "/mnt/sdb1/media";
        writeable = "yes";
      };

      TimeMachine = {
        path = "/mnt/sdb1/timemachine";
        writeable = "yes";
        "fruit:time machine" = "yes";
      };
    };
  };

  ## Used to advertise the shares to Windows hosts
  services.samba-wsdd = {
    enable = true;
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
}
