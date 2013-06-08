name "db-master"
description "Configure node as a db-master."
default_attributes()
override_attributes()
run_list(
  "recipe[ohai]",
  "recipe[custom-setup]"
)