{config,pkgs,...}:
{
  boot.loader.systemd-boot.enable = false;
    boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      devices = ["nodev"];
      enable = true;
      efiSupport = true;
     # useOSProber = true;
      extraEntries = ''
      menuentry "Windows" {
        insmod part_gpt
        insmod fat
        insmod search_fs_uuid
        insmod chain
        search --fs-uuid --set=root $FS_UUID
        chainloader /EFI/Microsoft/Boot/bootmgfw.efi
      }
      '';
    };
  };
}
