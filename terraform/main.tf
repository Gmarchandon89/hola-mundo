terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "hola_mundo_image" {
  name         = "hola-mundo-app"
  build_context = "${path.root}/.."  # Asumiendo que el Dockerfile está un nivel arriba
}

resource "docker_container" "hola_mundo_container" {
  name  = "hola-mundo-app"
  image = docker_image.hola_mundo_image.name
  ports {
    internal = 8080
    external = 8083
  }
}
