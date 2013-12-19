# Copyright (c) 2013 Riverbed Technology, Inc.
# This software is licensed under the terms and conditions of the MIT License set
# forth at https://github.com/riverbed/flyscript-vm-config/blob/master/LICENSE
# ("License").  This software is distributed "AS IS" as set forth in the License.


Vagrant.configure("2") do |config|
  
  config.vm.box = "FlyScriptAnsibleVM"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.ssh.guest_port = 22

  config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--cpus", 1]
      vb.customize ["modifyvm", :id, "--memory", 1024]
      vb.gui = true
  end

  # setup ip to match ansible_hosts file
  config.vm.network :forwarded_port, guest:80, host: 30080
  config.vm.network :forwarded_port, guest:8000, host: 38000
  config.vm.network :forwarded_port, guest:8888, host: 38888

  config.vm.provision :ansible do |ansible|
      ansible.sudo = true
      ansible.playbook = "provisioning/provision.yml"
      ansible.verbose = true
  end
   
end
