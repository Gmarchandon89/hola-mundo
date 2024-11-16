terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.22.0"
    }
  }
}
provider "docker" {}

resource "docker_image" "hola_mundo_image" {
  name         = "hola-mundo-app:latest"
  build {
    context    = "${path.root}/.."
    dockerfile = "${path.root}/../Dockerfile"
  }
}

resource "docker_container" "hola_mundo_container" {
  name  = "hola-mundo-app"
  image = docker_image.hola_mundo_image.name
  ports {
    internal = 8080
    external = 8083
  }
}

