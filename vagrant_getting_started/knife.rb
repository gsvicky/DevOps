current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "knifeuser"
validation_client_name   "adeptize-validator"
validation_key           "#{current_dir}/adeptize-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/adeptize"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["/usr/local/src/DevOps/configManagement/chef-repo/cookbooks"]
knife[:aws_access_key_id] = "#{ENV['AWS_ACCESS_KEY_ID']}"
knife[:aws_secret_access_key] = "#{ENV['AWS_SECRET_ACCESS_KEY']}"
knife[:region] = "#{ENV['EC2_REGION']}"
knife[:availability_zone] = "#{ENV['EC2_AVAILABILITY_ZONE']}"
