# Server Setup

## Setup

1. Run syncthing to get instantaneous backups (only srv1)
2. Capture periodic snapshots of data using ZFS (only srv1)
3. Back up periodic snapshots of data using ZFS (srv1 -> srv2)

## Backup Layout

There will be several folders backed up in ZFS:

* Archive - Not synchronized. Only exists on backup servers.
* Computer - Synchronized with Syncthing. Not really a home directory, but basically a replacement for how I use Dropbox.
* ComputerPhone - Synchronized with Syncthing. All files that I want synced on my phone and computer.
