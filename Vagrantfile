# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'centos/7'
  config.vm.hostname = 'blog.dpat.in'
  config.vbguest.auto_update = false
  config.vm.box_check_update = false
  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 512
    vb.name = 'blog.dpat.in'
  end
end
