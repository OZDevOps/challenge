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

Start all the vms with Vagrant

    vagrant up  (or vagrant up web01 ; vagrant up web02; vagrant up haproxy)

Test the load balancer from your favorite web browser

    http://192.168.50.54
    
Keep refresh, you should see the server name keep changing between web01.example.com and web02.example.com

