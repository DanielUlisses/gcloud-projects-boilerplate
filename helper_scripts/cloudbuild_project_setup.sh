#!/bin/bash

# must be connected with gcloud cli
PROJECT_ID=$(gcloud config get-value project)
gsutil mb gs://$PROJECT_ID-tfstate
gsutil versioning set on gs://$PROJECT_ID-tfstate

cd ../
sed -i s/PROJECT_ID/$PROJECT_ID/g environments/*/terraform.tfvars
sed -i s/PROJECT_ID/$PROJECT_ID/g environments/*/backend.tf

git add --all
git commit -m "Update project IDs and buckets"
# Push your code later to have it updated

gcloud services enable cloudbuild.googleapis.com
CLOUDBUILD_SA="$(gcloud projects describe $PROJECT_ID \
    --format 'value(projectNumber)')@cloudbuild.gserviceaccount.com"
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member serviceAccount:$CLOUDBUILD_SA --role roles/editor
