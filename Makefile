PREFIX := /usr/local

all:

install:
	install -d $(DESTDIR)/etc/cron.daily
	install -d $(DESTDIR)/etc/cron.weekly
	install -d $(DESTDIR)/etc/cron.monthly
	install -d $(DESTDIR)/etc/zfs-auto-snapshot
	install etc/zfs-auto-snapshot.cron.hourly   $(DESTDIR)/etc/cron.hourly/zfs-auto-snapshot
	install etc/zfs-auto-snapshot.cron.daily    $(DESTDIR)/etc/cron.daily/zfs-auto-snapshot
	install etc/zfs-auto-snapshot.cron.weekly   $(DESTDIR)/etc/cron.weekly/zfs-auto-snapshot
	install etc/zfs-auto-snapshot.cron.monthly  $(DESTDIR)/etc/cron.monthly/zfs-auto-snapshot
	install -m 0755 etc/zfs-auto-snapshot.apt $(DESTDIR)/etc/zfs-auto-snapshot/zfs-auto-snapshot.apt
	install -m 0644 etc/apt-preinvoke $(DESTDIR)/etc/apt/apt.conf.d/80-zfs-auto-snapshot
	install -d $(DESTDIR)$(PREFIX)/share/man/man8
	install -m 0644 src/zfs-auto-snapshot.8 $(DESTDIR)$(PREFIX)/share/man/man8/zfs-auto-snapshot.8
	install -d $(DESTDIR)$(PREFIX)/sbin
	install src/zfs-auto-snapshot.sh $(DESTDIR)$(PREFIX)/sbin/zfs-auto-snapshot

uninstall:
	rm $(DESTDIR)/etc/cron.daily/zfs-auto-snapshot
	rm $(DESTDIR)/etc/cron.weekly/zfs-auto-snapshot
	rm $(DESTDIR)/etc/cron.monthly/zfs-auto-snapshot
	rm $(DESTDIR)$(PREFIX)/share/man/man8/zfs-auto-snapshot.8
	rm $(DESTDIR)$(PREFIX)/sbin/zfs-auto-snapshot
	rm $(DESTDIR)/etc/apt/apt.conf.d/80-zfs-auto-snapshot
	rm $(DESTDIR)/etc/cron.monthly/zfs-auto-snapshot
	rmdir $(DESTDIR)/etc/zfs-auto-snapshot
