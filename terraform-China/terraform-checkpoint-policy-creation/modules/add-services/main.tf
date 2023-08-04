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

resource "checkpoint_management_publish" "example" {
    depends_on = [
    checkpoint_management_service_tcp.example_service_obj01
  ]
}