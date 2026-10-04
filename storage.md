# Storage

## lsblk before
```
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0    7:0    0     4K  1 loop /snap/bare/5
loop1    7:1    0  66.8M  1 loop /snap/core24/1643
loop2    7:2    0 260.3M  1 loop /snap/firefox/8763
loop3    7:3    0    20M  1 loop /snap/desktop-security-center/151
loop4    7:4    0  16.5M  1 loop /snap/firmware-updater/226
loop5    7:5    0  91.7M  1 loop /snap/gtk-common-themes/1535
loop6    7:6    0 614.5M  1 loop /snap/gnome-46-2404/164
loop7    7:7    0   1.5M  1 loop /snap/hwctl/123
loop8    7:8    0   402M  1 loop /snap/mesa-2404/1839
loop9    7:9    0  18.8M  1 loop /snap/prompting-client/222
loop10   7:10   0  11.8M  1 loop /snap/snap-store/1390
loop11   7:11   0  50.1M  1 loop /snap/snapd/27710
loop12   7:12   0   828K  1 loop /snap/snapd-desktop-integration/391
sda      8:0    0    25G  0 disk 
├─sda1   8:1    0     1M  0 part 
└─sda2   8:2    0    25G  0 part /
sr0     11:0    1  50.7M  1 rom  /run/media/vboxuser/VBox_GAs_7.2.20
```

## lsblk after reboot
```
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0    7:0    0   512M  0 loop /data
loop1    7:1    0  66.8M  1 loop /snap/core24/1643
loop2    7:2    0     4K  1 loop /snap/bare/5
loop3    7:3    0    20M  1 loop /snap/desktop-security-center/151
loop4    7:4    0 260.3M  1 loop /snap/firefox/8763
loop5    7:5    0  16.5M  1 loop /snap/firmware-updater/226
loop6    7:6    0 614.5M  1 loop /snap/gnome-46-2404/164
loop7    7:7    0  91.7M  1 loop /snap/gtk-common-themes/1535
loop8    7:8    0   1.5M  1 loop /snap/hwctl/123
loop9    7:9    0   402M  1 loop /snap/mesa-2404/1839
loop10   7:10   0  18.8M  1 loop /snap/prompting-client/222
loop11   7:11   0  11.8M  1 loop /snap/snap-store/1390
loop12   7:12   0  50.1M  1 loop /snap/snapd/27710
loop13   7:13   0   828K  1 loop /snap/snapd-desktop-integration/391
sda      8:0    0    25G  0 disk 
├─sda1   8:1    0     1M  0 part 
└─sda2   8:2    0    25G  0 part /
sr0     11:0    1  50.7M  1 rom  /run/media/vboxuser/VBox_GAs_7.2.20
```

## /etc/fstab line
```
UUID=7d8622b9-048d-4b1c-bae2-1085166891dd  /data  ext4  defaults,nofail,x-systemd.requires=data-loop.service  0  2
```

## findmnt /data after reboot
```
TARGET SOURCE     FSTYPE OPTIONS
/data  /dev/loop0 ext4   rw,relatime
```

Layout: 512 MB loopback file /var/disks/data.img, ext4, label DATA. A loop device does not survive a reboot, so data-loop.service re-attaches it and the fstab line pulls it in via x-systemd.requires.
