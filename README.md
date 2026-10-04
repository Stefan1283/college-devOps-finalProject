# Linux Fundamentals: Final Project

A fresh Ubuntu VM customised end to end.

- `boot.md`: observed boot sequence, the 7 file types, FHS notes
- `system-report.txt`: snapshot built with pipes, redirection and a glob
- `users.md`: non-root sudo user, `devs` group, SGID `/srv/shared`
- `storage.md`: loopback volume at `/data`, mounted by UUID with `nofail`, reboot-tested
- `dotfiles/`: aliases, PATH and PS1 (append `bashrc-snippet` to `~/.bashrc`)
- `bin/`: `up` and `heartbeat.sh`
- `systemd/`: heartbeat service and timer, plus `data-loop.service`
