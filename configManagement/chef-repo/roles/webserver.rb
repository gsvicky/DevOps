name "webserver"
description "Configure node as a webserver."
default_attributes()
override_attributes()
run_list(
  "role[base]",
  "recipe[tomcat]",
  "recipe[deployapp]"
)