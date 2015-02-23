FROM jenkins
MAINTAINER tuabache

# Switch to user root to use apt-get
USER root

# Install git, download and extract Stash and create the required directory layout.
# Try to limit the number of RUN instructions to minimise the number of layers that will need to be created.
RUN apt-get update -qq                                                            \
    && apt-get install -y --no-install-recommends                                 \
                build-essential                              \
    && apt-get clean autoclean                                                    \
    && apt-get autoremove --yes                                                   \
    && rm -rf                  /var/lib/{apt,dpkg,cache,log}/

# Download the VMware player installer
RUN wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-11.1.0-2496824.x86_64.bundle
#wget https://download3.vmware.com/software/player/file/VMware-Player-6.0.5-2443746.x86_64.bundle 

# Accept the EULA
# http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2053973
ENV VMWARE_EULAS_AGREED yes

# Install VMware Workstation Trial
# http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2053973
RUN bash  VMware-Workstation-Full-11.1.0-2496824.x86_64.bundle --required

# Install packer
# TODO put at sensible location...
RUN mkdir packer &&  cd packer && wget http://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip && unzip packer_0.7.5_linux_amd64.zip && cd ..

# Add packer to the 
# TODO does not work as desired... Packer executable is at /packer/packer
ENV PATH packer:$PATH

RUN chmod -R a=rx /var/log/vmware/

# Switch back to user jenkins
USER jenkins



