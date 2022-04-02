resource "fortios_system_interface" "trname" {
  name         = "internal3"
  type         = "physical"
  vdom = "root"
  alias = "newtest"
}