# Surface Overlay
An ebuild repository for packages related to Microsoft Surface devices.
Most ebuilds here are based on the great work at 
[linux-surface](https://github.com/linux-surface/linux-surface).
This overlay is still a WIP, so more packages will be added over time.

## Installing
You can add this overlay via
[eselect repository](https://wiki.gentoo.org/wiki/Eselect/Repository) or
[layman](https://wiki.gentoo.org/wiki/Layman).

## More information
Details about each package available in this repository.

### app-admin/iptsd
This is required on kernel v5.8 and up to enable touch and pen input for
devices that use IPTS. Once it is installed, you can start it with
`rc-service iptsd start` or have it start automatically with
`rc-update add iptsd default`.

Sometimes the daemon crashes when you put your device to sleep. I'm not
sure exactly why this happens, but you can restart the daemon with
`rc-service iptsd restart`.

### app-misc/surface-control
This utility program allows you to control various aspects of a Surface device
including the performance mode (for all models) as well as the latch and dGPU
(for Surface Books). Run it from the command line with `surface`.

### sys-kernel/surface-sources
This installs sources files for the Linux kernel. The sources are based on
[sys-kernel/gentoo-sources](https://packages.gentoo.org/packages/sys-kernel/gentoo-sources)
with the linux-surface patches applied on top to enable features specific to
Surface devices.

Ebuilds for this package follow the stable releases of
sys-kernel/gentoo-sources (a.k.a. LTS releases of the kernel). If you want
to use a different kernel version, you can install kernel sources from the main
Gentoo repository and have emerge automatically apply the linux-surface patches
for you. See the
[/etc/portage/patches](https://wiki.gentoo.org/wiki//etc/portage/patches)
wiki page for more information.
