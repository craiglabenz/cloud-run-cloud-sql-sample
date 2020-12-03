#! /bin/bash

export PROJECT_ID=
export REGION=
export CLOUD_SQL_INSTANCE_NAME=
export CONNECTION_NAME=$PROJECT_ID:$REGION:$CLOUD_SQL_INSTANCE_NAME

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