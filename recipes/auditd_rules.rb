# Cookbook Name:: stig
# Recipe:: auditd_rules
# Author: Ivan Suftin <isuftin@usgs.gov>
# Description: Add this recipe in your cookbook and pass in
# attributes for rule sets or use the defaults below

reboot 'now' do
  action :nothing
  reason 'Cannot continue Chef run without a reboot.'
  delay_mins 2
end

template '/etc/audit/rules.d/audit.rules' do
  source 'audit_rules.erb'
  mode '0640'
  owner 'root'
  group 'root'
  variables(buffer: node['stig']['auditd']['buffer'],
            failure_mode: node['stig']['auditd']['failure_mode'],
            rules: node['stig']['auditd']['rules'])
  notifies :restart, 'service[auditd]', :immediately
  #notifies :reboot_now, 'reboot[now]', :immediately
end
