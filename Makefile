
install-navigator:
	# create config dir and install config
	sudo mkdir -p /etc/gatorsync/
	sudo cp gatorsync.conf /etc/gatorsync/gatorsync.conf
	# install syncer
	sudo cp chart_world_sync /usr/local/bin/chart_world_sync
	sudo cp rsync.awk /etc/gatorsync/rsync.awk
	sudo chmod 755 /usr/local/bin/chart_world_sync

install-fileserver:
	sudo cp chart_world_import /usr/local/bin/chart_world_import
	sudo crontab -u root chart_world_import.cron

install-ssh-sync-key:
	[[ ! -d "~/.ssh/" ]] && mkdir -p "~/.ssh/"
	[[ ! -f "~/.ssh/navigator_sync_key.pub" ]] \
		&& ssh-keygen -f ~/.ssh/navigator_sync_key.pub -P '' \
		&& ssh-copy-id -i ~/.ssh/navigator_sync_key.pub comms@files








