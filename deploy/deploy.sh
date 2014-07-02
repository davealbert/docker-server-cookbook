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
export username=\"$username\" &&
export password=\"$password\" &&
sudo rm -rf ~/chef &&
mkdir ~/chef &&
cd ~/chef &&
tar xj &&
cat id_rsa.pub >> ~/.ssh/authorized_keys &&
bash install.sh
"

