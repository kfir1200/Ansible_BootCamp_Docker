
# Description 

In this project i used ansible to deploy the ![weight tracker application](https://github.com/kfir1200/bootcamp-app).

The infrastracture was build using terraform: https://github.com/kfir1200/Terraform_BootCamp

# Install and Configuration

## install Ansible on the vm controller 

1. run `sudo apt update` 
1. run `sudo apt -y upgrade`
1. run `sudo apt -y install ansible`

## Create ssh key and copy to remote machines  

1. run `ssh-keygen`
2. press enter for filename and then press enter twice with passphrase empty
3. run `ssh-copy-id <username>@<node machine id>` on every node you have, for exmaple `kfir@1.2.3.4`

## How to use this project

1. clone or download this project
2. run `sudo nano Ansible_BootCamp/inventories/stage/hosts` and enter the vm's ip in your staging environment and then save the file.
3. run `sudo nano Ansible_BootCamp/inventories/prod/hosts` and enter the vm's ip in your production environment and then save the file.
4. run `ansible-galaxy collection install community.general` to install ipify_facts ansible module
5. create a file `main.yml` in `Ansible_BootCamp\inventories\stage\group_vars` with those values:  

        load_balancer_ip: ""
        okta_url: ""
        okta_id: ""
        okta_secret: ""
        db_ip: ""
        db_user_name: ""
        db_name: ""
        db_pass: ""
        db_port: ""
5. create a file `main.yml` in `Ansible_BootCamp\inventories\prod\group_vars` with the values from step 5.
6. edit the values according to your credentials.
7. run `cd  Ansible_BootCamp`.
8. to run the playbook on the staging environment enter this command:

         ansible-playbook -i inventories/stage --extra-vars server_env_group="stage_servers env=stage" main.yml

8. to run the playbook on the production environment enter this command:

         ansible-playbook -i inventories/prod --extra-vars server_env_group="prod_servers env=prod" main.yml
