#! /bin/bash

export PROJECT_ID=tabs-vs-spaces-297517
export REGION=europe-north1
export CONNECTION_NAME=tabs-vs-spaces-297517:europe-north1:poll-db

gcloud builds submit \
  --tag gcr.io/$PROJECT_ID/poll \
  --project $PROJECT_ID

gcloud run deploy poll \
  --image gcr.io/$PROJECT_ID/poll \
  --platform managed \
  --region $REGION \
  --allow-unauthenticated \
  --add-cloudsql-instances $CONNECTION_NAME \
  --project $PROJECT_ID