
#!/bin/bash

#setup and configure aget in azure devops
mkdir myagent && cd myagent
wget https://vstsagentpackage.azureedge.net/agent/2.202.0/vsts-agent-linux-x64-2.202.0.tar.gz
tar zxvf ~/vsts-agent-linux-x64-2.202.0.tar.gz 

./config.sh --unattended \
--url <your_devops_organization_url \
--auth PAT \
--token <your_token> \
--pool <your_pool_name> \
--acceptTeeEula
sudo ./svc.sh install $USER
sudo ./svc.sh start

# installing ansible 
sudo apt update
sudo apt -y upgrade
sudo apt -y install zip
sudo apt -y install ansible
ansible-galaxy collection install community.general

#installing docker 
sudo apt-get install \
	 ca-certificates \
	 curl \
	 gnupg \
	 lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 
sudo apt -y update
sudo apt -y install docker-ce docker-ce-cli containerd.io
clear