#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="vigilante"
iso_label="ARCH_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Arch Linux <https://archlinux.org>"
iso_application="Arch Linux Live/Rescue DVD"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-ia32.grub.esp' 'uefi-x64.grub.esp'
           'uefi-ia32.grub.eltorito' 'uefi-x64.grub.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
  # ["/etc/passwd"]="0:0:400"
  ["/etc/shadow"]="0:0:400"
  ["/etc/group"]="0:0:400"
  ["/etc/gshadow"]="0:0:400"
  ["/etc/sudoers"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"

  # Custom scripts
  ["/home/elliot/.config/scripts/rofi/common_directories.sh"]="0:0:755"
  ["/home/elliot/.config/scripts/rofi/power_menu.sh"]="0:0:755"
  ["/home/elliot/.config/scripts/system/lock.sh"]="0:0:755"
  ["/home/elliot/.config/scripts/system/update.sh"]="0:0:755"
  ["/home/elliot/.config/scripts/application/launch_ranger.sh"]="0:0:755"
  ["/home/elliot/.config/scripts/polybar/info-hackspeed.sh"]="0:0:755"
  ["/home/elliot/.config/scripts/polybar/polybar-start.sh"]="0:0:755"
  ["/home/elliot/.config/scripts/polybar/updates-pacman-aurhelper.sh"]="0:0:755"
)
