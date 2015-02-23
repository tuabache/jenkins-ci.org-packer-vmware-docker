# jenkins-ci.org-packer-vmware-docker
Docker with Jenkins and packer and vmware.

# Build:
```
docker build -t jenkins-packer .
```

# Run
```
docker run --name tuabachenkins -p 8080:8080 -v ..../jenkins_home/:/var/jenkins_home jenkins-packer
```
