mpm
===

private files can go anywhere, but i put em here
```
mkdir -p ~/.mpm
```

create self signed cert
```
openssl genrsa -out ~/.mpm/server.key 2048 && \
openssl req -new -key ~/.mpm/server.key -out ~/.mpm/server.csr && \
openssl x509 -req -days 999 -in ~/.mpm/server.csr -signkey ~/.mpm/server.key -out ~/.mpm/server.crt
```
create a password file for nginx basic auth
```
htpasswd -b -c ~/.mpm/passwd username password
```
 
 
```
run the node app on port 3000
run nginx on port 80.  nginx-mpm.config is configured for basic auth, ssl and proxying to localhost:3000
```

