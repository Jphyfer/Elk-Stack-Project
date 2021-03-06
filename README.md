# Elk-Stack-Project
Created an ELK stack that monitors load balanced webservers using filebeat and metricbeat
Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

* [Elk Stack Project Diagram](https://github.com/Jphyfer/Elk-Stack-Project/blob/9634dea0a49380e212517f4345421fdbfdf1ad3e/Diagrams/Elk%20Stack%20Project%20Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the .YML file may be used to install only certain pieces of it, such as Filebeat.

* [pentest.yml](Ansible/pentest.yml)
* [Hosts File](Ansible/Hosts_File.txt)
* [ansible.cfg](Ansible/ansible.cfg)
* [install-elk.yml](Ansible/install-elk.yml)
* [filebeat-playbook.yml](Ansible/filebeat-playbook.yml)
* [filebeat-config.yml](Ansible/filebeat-config.yml)
* [metricbeat-playbook.yml](Ansible/metricbeat-playbook.yml)
* [metricbeat-config.yml](Ansible/metricbeat-config.yml)

This document contains the following details:
- Description of the Topologuy
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build2


Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly redundant, in addition to restricting access to the network.

* What aspect of security do load balancers protect?

The load balancers will prevent high traffic such as a DDOS attack from bringing down the page by distributing traffic between the web servers attached to the load balancer.

*  What is the advantage of a jump box?

The advantage of using a jump box allows the user access to the webservers and whatever they need but from a single point that can more easily be secured, managed, and observed for any issues.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network and system logs.

* What does Filebeat watch for?

Filebeat generates and organizes logfiles and logs different information about the file system such as which files have been changed and when the change occurred.

* What does Metricbeat record?

Metricbeat collects the metrics of the machine such as information from the operating system and the services that run on the servers.





The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name       | Function     | IP Address | Operating System |
|------------|--------------|------------|------------------|
| Jump Box   | Gateway      | 10.0.0.4   | Linux            |
| Web-1      | DWVA         | 10.0.0.5   | Linux            |
| Web-2      | DWVA         | 10.0.0.6   | Linux            |
| Web-3      | DWVA         | 10.0.0.7   | Linux            |
| ELK Server | Logs/Metrics | 10.1.0.4   | Linux            |


Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jump box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

* My Personal Public IP Address

Machines within the network can only be accessed by the IP 10.0.0.4 via SSH.

Which machine did you allow to access your ELK VM? What was its IP address?

* My Personal Public IP Address on port 5601

A summary of the access policies in place can be found in the table below.

| Name       | Publicly Accessible | Allowed IP Addresses    |
|------------|---------------------|-------------------------|
| Jump Box   | Yes                 | Personal Public IP      |
| Web-1      | No                  | 10.0.0.4                |
| Web-2      | No                  | 10.0.0.4                |
| Web-3      | No                  | 10.0.0.4                |
| Elk Server | No                  | Personal IP on TCP 5601 |

Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

* What is the main advantage of automating configuration with Ansible?

The main advantage with using ansible was the ability to use the YAML playbooks to configure and automate the webservers easily and effectively. 



The playbook implements the following tasks:

* The first task specifies which group of machines will be affected as well as which remote host is being used.
![Task 1](https://user-images.githubusercontent.com/84148317/147289230-62bbd932-68da-4c79-805e-d133ad2b03a4.PNG)
* The second, third and fourth tasks installs docker.io, python3-pip and docker for python3-pip.
![Task 2](https://user-images.githubusercontent.com/84148317/147289246-a7fb9581-d276-43d6-8aae-a09934560772.PNG)
* The fifth task add more system memory to the vm and is set at 262144.

![task 3](https://user-images.githubusercontent.com/84148317/147289255-c96d0d20-16f4-4ccb-ab6a-82057f4d52eb.PNG)

* The sixth task launches a elk container and opens it to ports 5601:5601,9200:9200,5044:5044.

![task 5](https://user-images.githubusercontent.com/84148317/147289274-f8b02820-76a4-49ce-998b-399ce78bbd81.PNG)

* The seventh and last task simply makes sure to start the docker service on boot of the VM.

![task 6](https://user-images.githubusercontent.com/84148317/147289275-8a0239c5-cd6e-400c-9b21-78332d2b3c9d.PNG)



The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![elk_server_docker_ps](https://user-images.githubusercontent.com/84148317/147289163-e4c2c457-1d36-424a-a4de-6f7616bc6897.PNG)
![Web_1_Docker_ps](https://user-images.githubusercontent.com/84148317/147289185-ba55c244-c085-4d80-9d6e-371e92dd9720.PNG)
![web_2_docker_ps](https://user-images.githubusercontent.com/84148317/147289193-83a84be1-44e0-4505-a604-ac160d910106.PNG)





Target Machines & Beats

This ELK server is configured to monitor the following machines:

* Web-1 10.0.0.5

* Web-2 10.0.0.6

* Web-3 10.0.0.7


We have installed the following Beats on these machines:

* Filebeats on Web-1, Web-2, and Web-3

* Metricbeats on Web-1, Web-2, and Web-3

These Beats allow us to collect the following information from each machine:

* Filebeat collects log events with information such as which files and time from the file system when a change occurs.
* Metricbeats collects metric data and statistics from the systems it is monitoring such as unique visitors, country of origin, CPU usage etc. 


Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook YAML file to Ansible file in the container under /etc/ansible.

- Update the hosts file to include both webservers and their IPS and in a separate line the ELK server and its IP. You will specify which machine to run in the YAML file under the hosts line where you could put webservers for filebeat and metricbeat or elk to install the elk installation.

 ![Host File machines](https://user-images.githubusercontent.com/84148317/147289507-ef575c7d-6d26-4df0-8149-04943d9668a3.PNG)


- Run the playbook, and navigate to http://[your.VM.IP]:5601/app/kibana to check that the installation worked as expected.
- In Kibana you will move to the data you are getting, selecting on the appropriate system and scrolling down to check data.
- One the data is checked you can enter your dashboard.


_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

* Sudo dock start (container name)
* sudo docker attach (container name)
* Make sure Hosts file have correct IP for machines and Make sure ansible config has correct remote host
* move to ansible container with /etc/ansible
* Copy yml file into ansible 
* Run command ansible-playbook (YML file)


