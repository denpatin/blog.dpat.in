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
  config.vm.provision :reload
  config.vm.provision 'shell', inline: <<-SHELL
    source /vagrant/variables.sh
    if [ "$LOCAL_KERNEL" = "$MAINLINE_KERNEL" ];
    then
      echo "Your kernel is up-to-date!"
    else
      echo "Your kernel is $LOCAL_KERNEL, not $MAINLINE_KERNEL! Quitting...";
      exit 1;
    fi
  SHELL
end
