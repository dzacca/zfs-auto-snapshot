PATH="/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

@reboot root which zfs-auto-snapshot > /dev/null || exit 0 ; zfs-auto-snapshot --quiet --syslog --label=boot --keep=5 //
