{config,pkgs,...}:
{
  boot.loader.systemd-boot.enable = false;
    boot.loader = {
    grub = {
      devices = ["/dev/sda"];
      enable = true;
      efiSupport = true;
      useOSProber = true;
      version = 2;
    };
  };
}