name "webserver"
description "Configure node as a webserver."
default_attributes(
  "apache" => {
    "listen_ports" => ["80", "443"],
    "contact" => "gsvicky@gmail.com",
    "default_modules" => ["status","alias","autoindex","dir","env","mime","negotiation","setenvif"]
  }
)
override_attributes()
run_list(
  "role[base]",
  "recipe[tomcat]",
  "recipe[deployapp]"
)