eksctl utils associate-iam-oidc-provider --region us-east-1 --cluster wiz-eks-cluster --profile cpopaadmin --approve
eksctl create iamserviceaccount --region us-east-1 --cluster=wiz-eks-cluster --namespace=kube-system --name=aws-load-balancer-controller --attach-policy-arn=arn:aws:iam::590370805834:policy/LoadBalancerControllerPolicy-wiz-eks --override-existing-serviceaccounts --profile cpopaadmin  --approve
helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=wiz-eks-cluster --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer-controller