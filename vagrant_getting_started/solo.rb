current_dir = File.dirname(__FILE__)
log_level                :debug
log_location             STDOUT
node_name                "knifeuser"
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["/usr/local/src/DevOps/configManagement/chef-repo/cookbooks"]
