current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "node1"
validation_client_name   "adeptize-validator"
validation_key           "#{current_dir}/adeptize-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/adeptize"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
