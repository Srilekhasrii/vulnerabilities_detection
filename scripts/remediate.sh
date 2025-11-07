#!/bin/bash
set -e

echo "🛠️  Starting remediation process..."

# Optional: pull latest repo changes
git checkout main
git pull origin main

# Apply remediation steps
echo "🔧 Applying fixes..."
# Add custom remediation commands here
# e.g., rebuild patched Docker images
docker build -t myapp:patched ../

# Trigger Terraform deployment
echo "🌐 Triggering Terraform deployment..."
cd terraform || exit 1
terraform init -input=false
terraform plan -out=tfplan -input=false
terraform apply -input=false tfplan

echo "✅ Terraform deployment completed."

# Rebuild Docker image post Terraform deploy (optional)
docker build -t myapp:latest ../

echo "🎉 Remediation and deployment finished."
