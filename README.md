# repo_web
repo to test Kubernetes integration

Neccessary updates before using code to mail: mail.py
line-10: provide sender's mail address
line-11: provide app password, create before-hand
line-15: add/remove recievers' addresses

line-16: to edit the subject of mail to send
line-17: edit the body of the mail

To use the Dockerfile a pre-configured Single-Node Kubernetes Cluster is must.
Copy the 4 files to the same directory where the Dockerfile is present
1. ca.crt
2. client.crt
3. client.key
4. config file
