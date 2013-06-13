#
# Cookbook Name:: devops-setup
# Attributes:: default
#

default["devops-setup"]["log-level"] = ":debug"
default["devops-setup"]["node-name"] = "knifeuser"
default["devops-setup"]["cookbook-path"] = "/usr/local/src/DevOps/configManagement/chef-repo/cookbooks"
default["devops-setup"]["validation_client_name"] = "adeptize-validator"
default["devops-setup"]["validation_key"] = "\#{current_dir}/adeptize-validator.pem"
default["devops-setup"]["chef_server_url"] = "https://api.opscode.com/organizations/adeptize"

default["devops-setup"]["knife"]["log-level"] = ":info"

