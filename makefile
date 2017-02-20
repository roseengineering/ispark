ispark:
	ansible-playbook ispark.yml
kill: clean
	python3 kill_all.py
clean: 
	rm -f push.sh notebook.sh master.sh proxy.sh *.retry
.PHONY: ispark kill clean



