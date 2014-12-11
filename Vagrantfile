VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box "

  config.vm.provision :shell, :path => "upgrade_puppet.sh"
  config.vm.provision :puppet do |puppet|
    puppet.module_path = "modules"
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "vagrant.pp"
    puppet.options = ['--verbose']
  end
  
  config.vm.provider "virtualbox" do |v|
    host = RbConfig::CONFIG['host_os']
  
    # Give VM 1/4 system memory & access to all cpu cores on the host
    if host =~ /darwin/
     cpus = `sysctl -n hw.ncpu`.to_i
      # sysctl returns Bytes and we need to convert to MB
      mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
    elsif host =~ /linux/
      cpus = `nproc`.to_i
      # meminfo shows KB and we need to convert to MB
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
    else # sorry Windows folks, I can't help you
      cpus = 2
      mem = 1024
    end

    v.customize ["modifyvm", :id, "--memory", mem]
    v.customize ["modifyvm", :id, "--cpus", cpus]
    v.customize ["modifyvm", :id, "--rtcuseutc", "on"]
  end

  config.vm.define :web01 do |config|
     config.vm.host_name = "web01.example.com"
     config.vm.network :private_network, ip: "192.168.50.50"
  end

  config.vm.define :web02 do |config|
     config.vm.host_name = "web02.example.com"
     config.vm.network :private_network, ip: "192.168.50.52"
  end  

  config.vm.define :haproxy do |config|
     config.vm.host_name = "haproxy.example.com"
     config.vm.network :private_network, ip: "192.168.50.54"
  end

end
