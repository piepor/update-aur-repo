# update-aur-repo

Simple bash script to update all AUR repositories contained in a given directory.

### **Usage**

Copy the executable in a directory included in the executable path (or add a new one) and

```bash
$ update-aur.sh /path/to/aur/packages
```

It is useful to create a pacman hook in order to launch it after every update.

Create and add *update-aur.hook* file to */etc/pacman.d/hooks*  with

```
# launch the script for updating AUR git repository
[Trigger]
Operation = Install
Operation = Upgrade
Operation = Remove
Type = Package
Target = *
[Action]
When = PostTransaction
Exec = /path/to/executable /path/to/aur/packages
```

