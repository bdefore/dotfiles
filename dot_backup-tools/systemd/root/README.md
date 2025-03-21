# For backkups that require directories with root, create symlinks for script, service, and timer files
sudo ln -s "$HOME/.backup-tools/systemd/root/fw-backup.service" /etc/systemd/system/
sudo ln -s "$HOME/.backup-tools/systemd/root/fw-backup.timer" /etc/systemd/system/
sudo ln -s "$HOME/.backup-tools/bin/restic-backup" /usr/local/bin/
