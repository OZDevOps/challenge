## Installation on OSX

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

