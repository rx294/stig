config = node[cookbook_name]
#
# %w[headers kernel].each do |type|
#   remote_file "#{Chef::Config[:file_cache_path]}/#{config["#{type}_rpm"]}" do
#     source "#{config['base_url']}/#{config["#{type}_rpm"]}"
#     checksum config["#{type}_checksum"]
#     not_if { config["#{type}_checksum"].empty? }
#     notifies :install, "rpm_package[#{config["#{type}_rpm"]}]", :immediately
#   end
# end
#
# rpm_package config['headers_rpm'] do
#   source "#{Chef::Config[:file_cache_path]}/#{config['headers_rpm']}"
#   action :nothing
# end
#
# rpm_package config['kernel_rpm'] do # ~FC037
#   source "#{Chef::Config[:file_cache_path]}/#{config['kernel_rpm']}"
#   notifies :run, 'execute[regenerate initramfs]', :immediately
#   notifies :run, "execute[#{cookbook_name}: update grub]", :immediately
#   notifies config['reboot_action'], 'reboot[kernel_update]', :immediately
#   action :nothing
# end
#
# execute 'regenerate initramfs' do
#   command 'dracut'
#   creates "/boot/initramfs-#{config['version']}.img"
#   action :nothing
# end
#
# execute "#{cookbook_name}: update grub" do
#   command <<-BASH
#     grub2-set-default 0
#     grub2-mkconfig -o /boot/grub2/grub.cfg
#   BASH
#   action :nothing
# end

# execute 'update kernel' do
#   command 'echo "hello"'
#   notifies config['reboot_action'], 'reboot[kernel_update]', :immediately
# end

reboot 'kernel_update' do
  reason 'Need to reboot with new kernel'
  action :request_reboot
  delay_mins 2
end
