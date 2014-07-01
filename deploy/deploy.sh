tar cj . | ssh -o 'StrictHostKeyChecking no' vagrant@localhost -p 2222 '
sudo rm -rf ~/chef &&
mkdir ~/chef &&
cd ~/chef &&
tar xj &&
cat id_rsa.pub >> ~/.ssh/authorized_keys &&
sudo bash install.sh'
