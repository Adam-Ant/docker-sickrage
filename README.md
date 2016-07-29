# docker-sickrage
Dockerfile for running the TV management and NZB searching tool SickRage. It expects a  partition to store data mapped to /config in the container, and a volume where your downloads should go stored at /media. Enjoy!  
This dockerfile uses a user with uid 439. Make sure this user has write access to the /config folder. 
##Example run command
`docker run -d --restart=always --name SickRage --volumes-from Data --volumes-from media -p 8081:8081 adamant/sickrage`
