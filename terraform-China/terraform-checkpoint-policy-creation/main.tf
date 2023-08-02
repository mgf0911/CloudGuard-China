

# Create network objects
resource "checkpoint_management_network" "example_network_obj" {
  name   = "Example_Network"
  subnet4 = "192.0.2.0"
  mask_length4 = 24
}

resource "checkpoint_management_network" "example_network_obj2" {
  name   = "Example_Network2"
  subnet4 = "192.0.3.0"
  mask_length4 = 24
}

resource "checkpoint_management_network" "example_network_obj3" {
  name   = "Example_Network3"
  subnet4 = "192.0.4.0"
  mask_length4 = 24
}

# Create a service object
resource "checkpoint_management_service_tcp" "example_service_obj" {
  name        = "Example_Service"
  port = 8989
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
resource "checkpoint_management_access_rule" "rule1" {
    depends_on = [
    checkpoint_management_network.example_network_obj, 
    checkpoint_management_network.example_network_obj2,
    checkpoint_management_network.example_network_obj3,
    checkpoint_management_service_tcp.example_service_obj
  ]
  layer = "Network"
  position = {top = "top"}
  name = "test1"
  enabled = true
  action = "Accept"
  source = ["Example_Network3"]
  destination = ["Example_Network", "Example_Network2"]
  service = ["Example_Service"]
}

resource "checkpoint_management_access_rule" "rule2" {
    depends_on = [
    checkpoint_management_network.example_network_obj, 
    checkpoint_management_network.example_network_obj2,
    checkpoint_management_network.example_network_obj3
  ]
  layer = "Network"
  position = {below = checkpoint_management_access_rule.rule1.name}
  name = "Specific Deny"
  enabled = true
  action = "Drop"
  source = ["Any"]
  destination = ["Example_Network", "Example_Network2"]
  service = ["Any"]
}


resource "checkpoint_management_publish" "example" { }