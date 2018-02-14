source 'https://supermarket.getchef.com'

metadata

cookbook 'auditd', '~> 1.0.1'
cookbook 'logrotate', '~> 2.1.0'
cookbook 'sysctl', '~> 0.8.1'

# The following is optional and only used if testing on the DOI network
cookbook 'doi_ssl_filtering', github: 'USGS-CIDA/chef-cookbook-doi-ssl-filtering', tag: 'v1.0.0'

#following includes nginx hardening cookbook
cookbook 'nginx-hardening', git: 'https://github.com/aaronlippold/chef-nginx-hardening.git'

cookbook 'apt'
cookbook 'build-essential'
cookbook 'yum-epel'
cookbook 'zypper'
