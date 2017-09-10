# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  # If no box is present on the computer, the latest CentOS 7 will be installed
  config.vm.box = 'centos/7'

  # Skip bothersome update checks
  config.vbguest.auto_update = false
  config.vm.box_check_update = false

  # Customize the hostname
  config.vm.hostname = 'blog.dpat.in'

  # If necessary, customize the RAM volume and VM name
  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 512
    vb.name = 'blog.dpat.in'
  end

  # If it's needed to update the Kernel, then uncomment the below lines
  config.vm.provision 'shell', path: 'update-kernel.sh', privileged: false
end
