name "db-master"
description "Configure node as a db-master."
default_attributes()
override_attributes()
run_list(
  "recipe[mysql::server]",
  "role[base]"
)