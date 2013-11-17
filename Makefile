
def_target : none

none :
	#dummy

# Copies the script to run automatically upon a network connection
install :
	sudo install -m 0755 -o root -g root dl-tagesschau.sh /etc/NetworkManager/dispatcher.d/99-tagesschau

