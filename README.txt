V1.5
sudo apt install git
cd ~/ && git clone --recursive https://github.com/stephendade/Rpanion-server.git
cd ~/Rpanion-server/deploy/ && ./RasPi2-3-4-5-deploy.sh
git clone https://github.com/Dzyga-FPV/FORPOST.git
cd FORPOST && chmod +x dzyga
sudo cp dzyga.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable dzyga.service
sudo systemctl start dzyga