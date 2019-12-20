To enable autologin, modify:
```
/etc/lightdm/lightdm.conf
```

Install service:
```
sudo ln -sf `realpath jupyterlab.service` /etc/systemd/system/
sudo systemctl enable jupyterlab.service
```

View logs:
```
sudo journalctl -u jupyterlab.service
```
