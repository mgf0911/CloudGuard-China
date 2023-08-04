# Create host objects
resource "checkpoint_management_host" "example_Host01" {
  name = "New Host01"
  color = "red"
  ipv4_address = "192.0.1.1"
}

resource "checkpoint_management_host" "example_Host02" {
  name = "New Host02"
  color = "yellow"
  ipv4_address = "192.0.2.1"
}

resource "checkpoint_management_host" "Host03" {
  name = "New Host03"
  ipv4_address = "192.0.3.1"
}



resource "checkpoint_management_publish" "example" {
    depends_on = [
    checkpoint_management_host.example_Host01,
    checkpoint_management_host.example_Host02,
    checkpoint_management_host.Host03
  ]
}