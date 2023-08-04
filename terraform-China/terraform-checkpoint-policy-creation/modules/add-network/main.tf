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



resource "checkpoint_management_publish" "example" {
    depends_on = [
    checkpoint_management_network.example_network_obj01,
    checkpoint_management_network.example_network_obj02,
    checkpoint_management_network.example_network_obj03
  ]
}