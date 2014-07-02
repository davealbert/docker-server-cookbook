# Remove old known host
ssh-keygen -R [localhost]:2222

# Read Username
echo -n username: 
read -s username
export username
echo

# Read Password
echo -n Password: 
read -s password
export password

tar cj . | ssh -o 'StrictHostKeyChecking no' vagrant@localhost -p 2222 "
sudo export username=\"$username\" &&
sudo export password=\"$password\" &&
sudo rm -rf ~/chef &&
mkdir ~/chef &&
cd ~/chef &&
tar xj &&
mkdir -p ~/.ssh &&
cat id_rsa.pub >> ~/.ssh/authorized_keys &&
sudo bash install.sh
"

