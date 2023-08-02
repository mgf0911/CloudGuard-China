# Create network objects
resource "checkpoint_management_network" "example_network_obj01" {
  name   = "Example_Network01"
  subnet4 = "192.168.1.0"
  mask_length4 = 24
}

resource "checkpoint_management_network" "example_network_obj02" {
  name   = "Example_Network02"
  subnet4 = "192.168.2.0"
  mask_length4 = 24
}

resource "checkpoint_management_network" "example_network_obj03" {
  name   = "Example_Network03"
  subnet4 = "192.168.3.0"
  mask_length4 = 24
}

# Create a service object
resource "checkpoint_management_service_tcp" "example_service_obj01" {
  name        = "Example_Service01"
  port = 9001
  keep_connections_open_after_policy_installation = false
  session_timeout = 0
  match_for_any = true
  sync_connections_on_cluster = true
  aggressive_aging = {
    enable = true
    timeout = 360
    use_default_timeout = false
  } 
}



# Create a rule that allows traffic from the Example_Network to any destination using Example_Service
resource "checkpoint_management_access_rule" "rule01" {
    depends_on = [
    checkpoint_management_network.example_network_obj01, 
    checkpoint_management_network.example_network_obj02,
    checkpoint_management_network.example_network_obj03,
    checkpoint_management_service_tcp.example_service_obj01
  ]
  layer = "Network"
  position = {top = "top"}
  name = "test1"
  enabled = true
  action = "Accept"
  source = ["Example_Network03"]
  destination = ["Example_Network01", "Example_Network02"]
  service = ["Example_Service"]
}

resource "checkpoint_management_access_rule" "rule02" {
    depends_on = [
    checkpoint_management_network.example_network_obj01, 
    checkpoint_management_network.example_network_obj02,
    checkpoint_management_network.example_network_obj03
  ]
  layer = "Network"
  position = {below = checkpoint_management_access_rule.rule01.name}
  name = "Specific Deny"
  enabled = true
  action = "Drop"
  source = ["Any"]
  destination = ["Example_Network01", "Example_Network02"]
  service = ["Any"]
}


resource "checkpoint_management_publish" "example" { }