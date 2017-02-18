ispark:
	ansible-playbook ispark.yml
kill: clean
	python3 kill_all.py
clean: 
	rm -f ispark.sh master.sh proxy.sh *.retry
.PHONY: ispark kill clean



