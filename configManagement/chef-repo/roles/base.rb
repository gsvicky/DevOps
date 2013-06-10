name "base"
description "Base role applied to all organization nodes."
default_attributes(

)
override_attributes(
  "chef_client" => {
    "init_style" => "init"
  }
)
run_list(
  "recipe[ohai]",
  "recipe[chef-client::delete_validation]",
  "recipe[chef-client::config]",
  "recipe[chef-client::service]",
  "recipe[yum::default]",
  "recipe[logrotate::default]",
  "recipe[custom-setup]"
)