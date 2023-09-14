# Harness Project for Bootcamp lab
update for pull request

# NGINX Pre-Req
On your K8S cluster you want to use, create an Nginx Controller if it doesn't already exist and validate that deployment.
1. `kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.1/deploy/static/provider/cloud/deploy.yaml`
2. `kubectl get deployments -n ingress-nginx`
3. `kubectl get services -n ingress-nginx`


Hello World!
