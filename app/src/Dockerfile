# Étape 1 : Construire l'application
FROM golang:1.21 AS builder

# Définit le répertoire de travail à l'intérieur du conteneur
WORKDIR /app

# Copie les fichiers nécessaires pour le build
COPY go.mod go.sum ./
RUN go mod download

# Copie tout le code source dans le conteneur
COPY . .

# Compile l'application en un binaire exécutable
RUN go build -o app-binary main.go

# Étape 2 : Image minimale pour exécuter l'application
FROM debian:bullseye-slim

# Définit le répertoire de travail
WORKDIR /app

# Copie le binaire depuis l'étape de build
COPY --from=builder /app/app-binary .

# Définit la commande par défaut pour exécuter le binaire
CMD ["./app-binary"]
