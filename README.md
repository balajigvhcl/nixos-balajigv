# Create AWS Instance with below AMI Image 
Instance type t3.small
AMI ID ami-0109314e01c9f888e
AMI name nixos/26.05.10057.cf9d2fb3e50f-x86_64-linux
reference URL will be shared later for selecting the appropriate image .

# create ssh key pair and connect to ec2 instance with root user 
note: root is the default user you can login on NixOS

# we can see 2 default configs under /etc/nixos, we can update the configuration.nix and rebuild as many times we can.
/etc/nixos/configuration.nix

# command to check the list of generations 
nix-env --profile /nix/var/nix/profiles/system --list-generations
nixos-rebuild list-generations

# to build and switch to new configuration 
nixos-rebuild switch

# lets commit the code to git and sync it 
generate PAT token before this and use in above command.
cd /etc/nixos
git init
git remote set-url origin <>
git push -u origin master
git status 

# check git repo for new files added 

# now perform changes in configuration.nix and pull the latest file 
git pull main master

# build it 
nixos-rebuild switch 

#list the generations , it should show the updated one as current 

