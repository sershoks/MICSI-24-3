provider "google" {
  project = var.project_id
  region  = var.region
}

data "google_project" "project" {
  project_id = var.project_id
}


resource "google_project_service" "required_services" {
  for_each = toset([
    "cloudbuild.googleapis.com",
    "artifactregistry.googleapis.com",
  ])
  project        = var.project_id
  service        = each.value
  disable_on_destroy = false
}

resource "google_artifact_registry_repository" "go_repo" {
  repository_id = "go-repo"
  project       = var.project_id
  location      = var.region
  format        = "DOCKER"
  description   = "Registry pour binaires Go"
}
