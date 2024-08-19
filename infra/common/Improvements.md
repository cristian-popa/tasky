### Additional Improvements

## Security related
1. We should use limited permissions for the mongo instance (access to parameter store and default encryption key for pulling secret strings as well as s3 put access and route53 hosted zone access)  - pending due to initial requirements
2. Tasky container role should not have admin privileges
3. S3 bucket with backups should not be public
4. Enforce the use of IMSV2 at the AWS account level: In AWS EC2 Dashboard Settings (and modify cloud init scripts to ensure they use IMDSvS2) -> Data Protection and security - Done
5. Setup load balancer controller in order not to use the classic ALB https://kubernetes-sigs.github.io/aws-load-balancer-controller/latest/deploy/installation/
6. Setup dns for tasky public endpoint
7. Setup ssl for tasky public endpoint
8. Setup mongodb server to enforce ssl for connections. Setup tasky to connect via SSL to mongo
9. Setup tasky to listen on SSL(generate self sign cert on containser start with an init container)
10. Check this startup error "GIN-debug] [WARNING] You trusted all proxies, this is NOT safe. We recommend you to set a value." and configure app best practices for go. 
11. Modify tasky and use aws go sdk to fetch secrets directly from ssm param store, add a role to the pod to allow read the required parameters from param store, as well as access to the decryption key used to encrypt the secrets. This way passwords are not exposed within the container, they'd be only in memory
12. Setup private endpoints for aws services such as s3, parameter store , ec2 apis etc. 
13. Run a private eks cluster
15. Deploy cloudfront and protect the origin via adjusting the security group to only allow CF POP ips or custom headers. CSet cache headers for the /assets web path
16. Deploy a WAF to protect against well known attacks
17. Enable ALB request and connection logging - done!
18. Enable security / compliance tools (inspector/config) or third party tools to scan for security issues and compliance

## Automation resilience related
1. Understand what can be done so that pods don't cache the dns response  (in case mongo changes its ip)
2. Refactor the individual cloud formation to use nested templates 
3. Deploy Karpenter for node scaling
4. Create helm charts instead of using services/deployments. Possibly write a k8s operator
5. Use github actions for automated builds / deploys
6. Deploy a clustered mongo across 2 azs and use srv records for discovery
7. Discuss DR options and setup a DR site if the app deployed is business critical










