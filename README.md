# nixos

## Installation

Here is the latest iso file for nixos 26.05 (Intel/AMD):

```bash
curl https://channels.nixos.org/nixos-26.05/latest-nixos-minimal-x86_64-linux.iso -o nixos.iso
```

You can put it on a usb key with:

```bash
sudo dd bs=4M if=nixos.iso of=/dev/[sdb] conv=fsync oflag=direct status=progress
```

Then *reboot*

```bash
shutdown -r now
```

Get your network connection via wifi :

```bash
nmtui
```

Partitionning the disk :

```bash
sudo fdisk /dev/[sda]
g # (gpt disk label)
n # new
1 # (partition number [1/128])
2048 # first sector
+500M # last sector (boot sector size)
t #
1 # (EFI System)
n
2
[default] # (fill up partition)
[default] # (fill up partition)
w # (write)
sudo mkfs.fat -F 32 /dev/[sda]1
sudo fatlabel /dev/[sda]1 NIXBOOT
sudo mkfs.ext4 /dev/[sda]2 -L NIXROOT
```

Mount partitions :

```bash
sudo mount /dev/disk/by-label/NIXROOT /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/disk/by-label/NIXBOOT /mnt/boot
```

Create swap file :

```bash
sudo dd if=/dev/zero of=/mnt/.swapfile bs=1024 count=2097152 # 2GB size
sudo chmod 600 /mnt/.swapfile
sudo mkswap /mnt/.swapfile
sudo swapon /mnt/.swapfile
```

Get the config :

```bash
sudo git clone https://github.com/epg1213/nixos.git /mnt/etc/nixos

```

nixos-install :

```bash
cd /mnt
sudo nixos-install .#blueteeth #for laptop, replace with blueeye for desktop
```

Then *reboot*

```bash
shutdown -r now
```

... enjoy, default password is "changeme"

