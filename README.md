Warcraft II in Wine in Docker
=============================

Run Warcraft II: Battle.net Edition on Linux via Docker and Wine. Works for me:

* Arch Linux, Gnome 3.22
  * Pulse Audio etc
  * Weston / Wayland
* Thinkpad X220
  * Intel integrated graphics (i915 driver)
* Docker 17.03

Instructions
------------

More of this could be automated, but this is as it stands:

* Extract purchased Warcraft II Battle.net edition CD to an ISO.
* Mount ISO; `mount -o loop,ro WAR2BNECD.iso /mnt/war2`
* Ensure `run` script paths match ISO and mount point.
* Build Docker image: `docker build --tag=pda/war2 .`
* Get a container shell with `./run`;
  * Run `winecfg`;
    * under Drives add `D:` pointing at your CD mount point, set it to CD-ROM.
    * save and exit `winecfg`.
  * `ln -s /path/to/WAR2BNECD.iso ~/.wine/dosdevices/d::` (double-colon)
    * so `d:` symlinks to the mount point, `d::` symlinks to the ISO.
  * Run `wine 'd:\setup.exe'`, enter your CD key, install to `C:\WAR2`

After the first time, running again should just be:

* `./run`
* `wine 'c:\WAR2\Warcraft II BNE.exe'`
  * alternatively: `wine ~/.wine/drive_c/WAR2/Warcraft\ II\ BNE.exe`

If the game runs as a tiny box in the corner of your screen, set your
system-wide resolution as low as it'll go and let your monitor scale it up.
