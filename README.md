### Installation on OSX

Install Vagrant and librarian-puppet

    include Vagrant (http://vagrantup.com) 
    include librarian-puppet (http://librarian-puppet.com/) 
    
Clone the git repository to local disk (need 2GB disk space for each vagrant box)

    git clone https://github.com/SydOps/challenge.git
    
Install all required gems

    bundle install

Install all Puppet modules with Puppet Librarian

    librarian-puppet install
    
    you can ignore below error message:
    Invalid module name 'apache', you should qualify it with 'ORGANIZATION-apache' for resolution to work correctly
    Invalid module name 'haproxy', you should qualify it with 'ORGANIZATION-haproxy' for resolution to work correctly

Start all the vms with Vagrant

    vagrant up  (or vagrant up web01 ; vagrant up web02; vagrant up haproxy)
    
( Notes: If you find some services don't run properly, run `vagrant provision BOXNAME` again, it will fix this issue)

Test the load balancer from your favorite web browser

    http://192.168.50.54
    
Keep refresh, you should see the server name keep changing between web01.example.com and web02.example.com

### If you need add more webservers under haproxy, for example, add two more web servers.

edit `manifests/vagrant.pp` file, you can add more IPs, or remove some IPs.

```
switch 

$webserver = ['192.168.50.50','192.168.50.52']

to

$webserver = ['192.168.50.50','192.168.50.52', '192.168.50.56', '192.168.50.58']
```
add more boxes in Vagrantfile 

```
  config.vm.define :web03 do |config|
     config.vm.host_name = "web03.example.com"
     config.vm.network :private_network, ip: "192.168.50.56"
  end

  config.vm.define :web04 do |config|
     config.vm.host_name = "web03.example.com"
     config.vm.network :private_network, ip: "192.168.50.58"
  end
  ```
  
No need run  `librarian-puppet install` this time. Because there is no change in puppet modues.
 
start new web servers and provision haproxy server.

    vagrant up web03; vagrant up web04; vagrant provision haproxy

Then you should see four webservers in haproxy server control 

```
http://192.168.50.54:8080
username: haproxy
password: topsecret
```
