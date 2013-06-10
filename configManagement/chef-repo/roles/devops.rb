name "devops"
description "Configure node as a devops workstation"
default_attributes()
override_attributes()
run_list(
  "role[base]",
  "recipe[git]"
)