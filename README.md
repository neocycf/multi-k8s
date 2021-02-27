# Introduction
Based on Stephen Grider's course. To deploy a React app using Google GKE.

## Architecture
![multi-k8s](/diagrams/multi-k8s.jpg)

## Travis deployment process
1. Create GCP service account for Travis
2. Encrypt service account using Travis's CLI
3. Install gcloud CLI
4. Setup gcloud auth, project, zone, GKE cluster
5. Login to Docker CLI
6. Build test version of client
7. Run tests
8. If tests sucessful, run deploy.sh 
   - build images with SHA tag
   - push images to docker hub
   - apply all manifests in k8s folder
   - imperatively set images to the latest for each deployment
