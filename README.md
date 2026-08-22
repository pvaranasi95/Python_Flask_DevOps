# Python_Flask_DevOps

#######################################
Using three pipelines in Jenkins
<img width="1479" height="224" alt="image" src="https://github.com/user-attachments/assets/e85c183d-baf4-485f-a54b-7bfaded4df74" />
FlaskApp Pipeline will fetch changes from Git and build image
Run_Container pipeline will run the container with the new image and create a Jira for approval

<img width="1409" height="646" alt="image" src="https://github.com/user-attachments/assets/5ad4cad8-7b24-48d1-a5f0-e9da49b3eef8" />

Push_To_DokcerHub pipeline will be auto triggered once Jira is approved. This pipeline will push the image to docker hub and make changes to deploy.yml file in K8S folder and push to a feature branch.

create PR from feature branch to main branch. Once PR is approved Argocd will automatically sync with the latest image.



