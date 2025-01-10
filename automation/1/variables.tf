variable "project_id" {
  description = "ID du projet GCP"
  type        = string
}

variable "region" {
  description = "Région GCP (par exemple europe-west1)"
  type        = string
}

variable "github_owner" {
  description = "Propriétaire du dépôt GitHub"
  type        = string
}

variable "github_repo" {
  description = "Nom du dépôt GitHub"
  type        = string
}
