# zfs-auto-snapshot
## dzacca1s fork

### What is zfs-auto-snapshot

An alternative implementation of the zfs-auto-snapshot service for Linux
that is compatible with zfs-linux and zfs-fuse.

Automatically create, rotate, and destroy periodic ZFS snapshots. This is
the utility that creates the @zfs-auto-snap_frequent, @zfs-auto-snap_hourly,
@zfs-auto-snap_daily, @zfs-auto-snap_weekly, and @zfs-auto-snap_monthly
snapshots if it is installed.

This program is a posixly correct bourne shell script.  It depends only on
the zfs utilities and cron, and can run in the dash shell.

### What's different in this fork
I have tuned the cron jobs to suit my personal needs. The cron job mimic my
setup on timeshit. This is the default schedule:
- No frequent snapshots
- No hourly snapshots
- 5 daily snapshots
- 3 weekly snapshots
- 2 monthly snapshots
- 5 apt snapshots

The makefile automatically create the folder `/etc/zfs-auto-snapshot` where 
a script is positioned for an apt automation.
Under `/etc/apt/apt.conf.d` a file is created to pre-invoke our script.
The current set-up creates a snapshot with the label `apt` every time apt is 
invoked to install or update packages and it keeps a rotation of five snapshots.


### TO DO
- Create a script to automate the creation of a snapshot at boot time
