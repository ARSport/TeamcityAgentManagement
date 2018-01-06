This is the repo for the ansible work for the CI group.



To run a Playbook that interacts with Ansible Vault you need to run as this:

ansible-playbook playbookname.yml --vault-password-file ~/conf/.vaultfile.py



Inside of the *.yml file you will find the reference to the script you want to run and the hosts you want to run your playbook.

Example
TO RECREATE ALL THE TC AGENTS

ansible-playbook TCAgentsStopRemoveDeleteVanguard.yaml --vault-password-file ~/conf/.vault_pass.txt

ansible-playbook TCAgentsStartVanguard.yaml --vault-password-file ~/conf/.vault_pass.txt

Wait until the agents appear as conected after they are upgraded. (TODO automate the whole process as of now I have not been able to identify a good timeframe when the agents pass from DISCONNECTED AGENT WILL UPGRADE to CONNECTED)

ansible-playbook TCAgentsAuthorizeEnableAddtopoolVanguard.yaml --vault-password-file ~/conf/.vault_pass.txt

