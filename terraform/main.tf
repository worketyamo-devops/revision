terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "http://localhost:2375"
}

resource "docker_container" "next_ct" {
  image = "harounrashid/next-app"
  name  = "next-ct2"
  ports {
    internal = 80
    external = 6600
  }
  restart = "always"
}

output "docker_container_ip" {
  value = docker_container.next_ct.network_data
}