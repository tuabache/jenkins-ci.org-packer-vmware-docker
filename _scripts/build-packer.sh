#! /bin/bash
if [ ! -d packer-windows ]
then
	git clone https://github.com/joefitzgerald/packer-windows.git
fi
cd packer-windows
git pull

find /var/log/vmware/ -name "*.log" -print0 | xargs -0 cat
exit

export PACKER_LOG=1 
export PACKER_LOG_PATH=./debug.log 
/packer/packer build windows_7.json
cat ./debug.log
