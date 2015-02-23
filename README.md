# jenkins-ci.org-packer-vmware-docker
Docker with Jenkins and packer and vmware.

# Build
```
docker build -t jenkins-packer .
```

# Run Jenkins
```
docker run -d --name tuabachenkins -p 8080:8080 -v ..../jenkins_home/:/var/jenkins_home jenkins-packer
```

# Build packer-windows with Jenkins
```
rm -fR packer-windows
git clone https://github.com/joefitzgerald/packer-windows.git
cd packer-windows
 
# TODO: fix location
/packer/packer build windows_7.json
```
