Vagrant.require_version ">= 1.5"

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/trusty64'

  script = <<EOF
echo "Test"
EOF
  config.vm.provision "shell", inline: script
end
