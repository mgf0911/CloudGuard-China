# Create a rule that allows traffic from the Example_Network to any destination using Example_Service
resource "checkpoint_management_access_rule" "rule01" {
  layer = "Network"
  position = {top = "top"}
  name = "test1"
  enabled = true
  action = "Accept"
  source = ["Example_Network03"]
  destination = ["Example_Network01", "Example_Network02"]
  service = ["Example_Service01"]
}

resource "checkpoint_management_access_rule" "rule02" {
    depends_on = [
    checkpoint_management_access_rule.rule01
  ]
  layer = "Network"
  position = {below = checkpoint_management_access_rule.rule01.name}
  name = "Allow1"
  enabled = true
  action = "Accept"
  source = ["Any"]
  destination = ["Example_Network01", "Example_Network02"]
  service = ["Any"]
}
resource "checkpoint_management_access_rule" "rule03" {
    depends_on = [
    checkpoint_management_access_rule.rule02
  ]
  layer = "Network"
  position = {below = checkpoint_management_access_rule.rule02.name}
  name = "Specific Deny2"
  enabled = true
  action = "Drop"
  source = ["Any"]
  destination = ["Example_Network03", "Example_Network02"]
  service = ["Any"]
}
resource "checkpoint_management_access_rule" "rule04" {
    depends_on = [
    checkpoint_management_access_rule.rule03
  ]
  layer = "Network"
  position = {below = checkpoint_management_access_rule.rule03.name}
  name = "Specific Deny3"
  enabled = true
  action = "Drop"
  source = ["Any"]
  destination = ["Example_Network02", "Example_Network01"]
  service = ["Any"]
}

resource "checkpoint_management_publish" "example" {
    depends_on = [
    checkpoint_management_access_rule.rule01,
    checkpoint_management_access_rule.rule02,
    checkpoint_management_access_rule.rule03,
    checkpoint_management_access_rule.rule04
  ]
}