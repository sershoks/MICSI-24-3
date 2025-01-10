variable "project_id" {
  default = "your-project-id"
}

variable "image_name" {
  default = "custom-image-with-app"
}

variable "zone" {
  default = "europe-west1-b"
}

variable "binary_path" {
  default = "./app-binary"
}

source "googlecompute" "debian" {
  project_id            = var.project_id
  source_image_family   = "debian-11"
  zone                  = var.zone
  machine_type          = "n1-standard-1"
  ssh_username          = "packer"
  image_name            = var.image_name
  disk_size             = 10
}

build {
  sources = ["source.googlecompute.debian"]

  provisioner "ansible" {
    playbook_file   = "playbook.yml"
    extra_arguments = ["--extra-vars", "binary_path={{user `binary_path`}}"]
  }
}
