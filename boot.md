# Boot story: linuxUbuntuProject

## Firmware

```
BIOS
```

## Bootloader files

```
System.map-7.0.0-38-generic
config-7.0.0-38-generic
grub
initrd.img
initrd.img-7.0.0-38-generic
initrd.img.old
mt86+ia32
mt86+x64
vmlinuz
vmlinuz-7.0.0-38-generic
vmlinuz.old
/boot/grub:
fonts
gfxblacklist.txt
grub.cfg
grubenv
i386-pc
locale
unicode.pf2
```

## Kernel

```
7.0.0-38-generic
```

## First 5 lines of dmesg

```
[    0.000000] Linux version 7.0.0-38-generic (buildd@lcy02-amd64-070) (x86_64-linux-gnu-gcc (Ubuntu 15.2.0-16ubuntu1) 15.2.0, GNU ld (GNU Binutils for Ubuntu) 2.46) #38-Ubuntu SMP PREEMPT_DYNAMIC Fri Sep  4 09:10:14 UTC 2026 (Ubuntu 7.0.0-38.38-generic 7.0.14)
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-7.0.0-38-generic root=UUID=b98f1fb0-b3b6-41b5-8ba1-6822982c3a61 ro crashkernel=2G-4G:320M,4G-32G:512M,32G-64G:1024M,64G-128G:2048M,128G-:4096M
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
```

## Default target

```
graphical.target
```

## Three services started at boot

```
  UNIT                          LOAD   ACTIVE SUB     DESCRIPTION
  accounts-daemon.service       loaded active running Accounts Service
  anacron.service               loaded active running Run anacron jobs
  avahi-daemon.service          loaded active running Avahi mDNS/DNS-SD Stack
  chrony.service                loaded active running chrony, an NTP client/server
  colord.service                loaded active running Manage, Install and Generate Color Profiles
```

## The 7 file types

```
brw-rw----   1 root   disk    7, 0 Oct  3 23:38 /dev/loop0
crw-rw-rw-   1 root   root    1, 3 Oct  3 23:38 /dev/null
drwxr-xr-x 141 root   root   12288 Oct  3 23:30 /etc
-rw-r--r--   1 root   root      19 Oct  3 23:18 /etc/hostname
lrwxrwxrwx   1 root   root      21 Aug 24 10:33 /etc/os-release -> ../usr/lib/os-release
srw-rw-rw-   1 root   root       0 Oct  3 23:38 /run/systemd/journal/stdout
prw-r--r--   1 arthur arthur     0 Oct  3 23:52 /tmp/demo.fifo
```

## FHS: /etc

```
234
cups
fstab
bash_completion.d
gshadow
group
```

## FHS: /var/log

```
README
alternatives.log
apport.log
apt
auth.log
bootstrap.log
btmp
chrony
cloud-init-output.log
cloud-init.log
36M	/var/log
```

## FHS: /proc

```
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
MemTotal:        3478936 kB
```

## Failed units

```
  UNIT            LOAD   ACTIVE SUB    DESCRIPTION
● vboxadd.service loaded failed failed vboxadd.service

Legend: LOAD   → Reflects whether the unit definition was properly loaded.
        ACTIVE → The high-level unit activation state, i.e. generalization of SUB.
        SUB    → The low-level unit activation state, values depend on unit type.

1 loaded units listed.
```

## My observations

- Firmware and bootloader: this VM boots with BIOS. The kernel is 7.0.0-38-generic.
- Default target: graphical.target. A multi-user.target gives a text-only login, while graphical.target adds a desktop login screen on top of it.
- Services started at boot (see the section above): accounts-daemon.service,avahi-daemon.service,chrony.service.
- /etc: on this box it has 234 entries. I edited /etc/fstab here to add the UUID line that mounts /data, and /etc/systemd/system holds my heartbeat service and timer.
- /var/log: it has 41 entries and the largest item is syslog. This is where services write their logs.
- /proc: this directory is not stored on disk. The kernel generates it live, and /proc/meminfo reports about 3397 MB of RAM on this machine.
- Failed units: 1 failed units at the time of writing.
