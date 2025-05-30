INSTALLATION

sudo apt install git
cd ~/ && git clone --recursive https://github.com/stephendade/Rpanion-server.git
cd ~/Rpanion-server/deploy/ && ./RasPi2-3-4-5-deploy.sh
git clone https://github.com/Dzyga-FPV/FORPOST.git
cd FORPOST && chmod +x dzyga
sudo cp dzyga.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable dzyga.service
sudo systemctl start dzyga

_________________________________________________________________________________
CHECK
sudo systemctl status dzyga

RESULT:
● dzyga.service - Dzyga
     Loaded: loaded (/etc/systemd/system/dzyga.service; enabled; preset: enabled)
     Active: active (running) since Fri 2025-05-30 21:30:12 EEST; 6s ago
   Main PID: 1710 (dzyga)
      Tasks: 2 (limit: 3921)
        CPU: 414ms
     CGroup: /system.slice/dzyga.service
             ├─1710 /home/rpidrone/FORPOST/dzyga
             └─1711 /home/rpidrone/FORPOST/dzyga

May 30 21:30:12 rpanion systemd[1]: Started dzyga.service - Dzyga.
__________________________________________________________________________________


WEB GUI is available at:
rpi_local_ip:3000

login: admin
pass: admin
