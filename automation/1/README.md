en premier activer le service

gcloud services enable artifactregistry.googleapis.com


Build automatique du binaire applicatif et le stockager dans Artefact Registry Le code applicatif est
fait en Go, il faudra donc créer une registry Go.
Dans la Pipeline les étapes suivantes soivent apparaitre:
Scan de sécurité afin de véfier que des secrets ne sont pas leak
Scan de securité afin de vérfier que l'application n'inclue pas de vulnérabilité
Build du binaire et Push dans Artefact Registry