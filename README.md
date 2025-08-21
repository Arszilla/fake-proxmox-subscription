## fake-proxmox-subscription
A Debian package to disables the "No valid subscription" dialog on all Proxmox
products (in theory), regardless of their version.

Based on [Jamesits/fake-pve-subscription][1]'s work. There are a few key
differences between his repository and this repository:

1. `pve-fake-subscription` has been ditched in favor of
`fake-proxmox-subscription` name. This should have been done in the first
place, as the script covers all 3 Proxmox products.
2. Added proper Debian packaging (instead of that JavaScript abomination).
3. Added GitHub Actions workflow to build and then publish `.deb` packages.

I believe 3. is the most critical change here. Because you wouldn't download
and install a `.deb` that you can't verify that it has been not been altered
with, would you?

### Features
This package should work and patch:
- Proxmox VE (5.x or later - 3.x and 4.x requires some manual actions)
- Proxmox Mail Gateway (5.x or later)
- Proxmox Backup Server (1.x or later)

What this package does is:
1. **Non-Intrusive**: Performs 0 modification to the system files.
2. **Future-Proof**: Requires no adjustments between system updates & major
upgrades.
3. **Hassle-Free**: Install or uninstall with ease, just 1 command and done.
4. **Debian-ized**: Comes as a proper Debian package, fresh from GitHub CI/CD
to provide transparency to its delivery.
5. **Fuck JavaScript**: No JavaScript is involved in the whole process, because
fuck JavaScript.

### Usage
#### Installation
Download the [latest `.deb`][2] file found under [releases][2] and install it
with `apt` or `apt-get`:

```
# curl -s https://api.github.com/repos/arszilla/fake-proxmox-subscription/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" | wget -i - -O fake-proxmox-subscription.deb
# apt install ./fake-proxmox-subscription.deb
```

### Uninstallation
Just run `apt` or `apt-get` with the `remove` flag:

```
# apt remove fake-proxmox-subscription
```

### Build It Yourself
You can easily build the package yourself, assuming you have a *Debian*-based
system:

```
$ sudo apt-get update
$ sudo apt-get install -y --no-install-recommends build-essential debhelper dpkg-dev
$ git clone https://github.com/Arszilla/fake-proxmox-subscription
$ cd fake-proxmox-subscription/
$ dpkg-buildpackage -us -uc -b
$ ls -al ../fake-proxmox-subscription_*
```

You can view and validate the contents of your newly build `.deb` while at it:

```
$ dpkg-deb --info ../fake-proxmox-subscription_*.deb
$ dpkg-deb --contents ./fake-proxmox-subscription_*.deb
```

Alternatively, a `Dockerfile` is available if you want to use `podman` or
`docker` to build the packages. Just transfer the generated file from `/opt/`.

I couldn't be really arsed with it or bother - I mainly used the `Dockerfile`
to validate my packaging, but reckoned someone might want to use it.

[1]: https://github.com/Jamesits/pve-fake-subscription
[2]: https://github.com/Arszilla/fake-proxmox-subscription/releases/latest
[3]: https://github.com/Arszilla/fake-proxmox-subscription/releases
[4]: https://github.com/Jamesits
