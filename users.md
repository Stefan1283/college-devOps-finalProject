# Users, groups and /srv/shared

## Commands used
```
sudo adduser arthur
sudo groupadd devs
sudo usermod -aG sudo,devs arthur
sudo mkdir -p /srv/shared
sudo chown root:devs /srv/shared
sudo chmod 2775 /srv/shared
```

## /etc/passwd and /etc/group rows
```
arthur:x:1001:1001:,,,:/home/arthur:/bin/bash
devs:x:1002:arthur
sudo:x:27:vboxuser,arthur
```

## Verification
```
uid=1001(arthur) gid=1001(arthur) groups=1001(arthur),27(sudo),100(users),1002(devs)
arthur:x:1001:1001:,,,:/home/arthur:/bin/bash
devs:x:1002:arthur
drwxrwsr-x 2 root devs 4096 Oct  3 23:31 /srv/shared
```
