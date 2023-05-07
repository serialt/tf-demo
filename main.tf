# Pulls the image
resource "docker_image" "nginx" {
  name         = var.service.name
  keep_locally = true

}


# Create a container
resource "docker_container" "nginx" {
  image    = "${var.service.name}:${var.service.tag}"
  name     = var.service.name
  hostname = var.service.name
  restart  = "always"
  tty      = true

  ports {
    internal = "80"
    external = "8899"
  }
}
