mpm
===
Create and consume private modules just like you do with open source modules by proxying npm through a couchdb that only stores your private packages.  This setup runs kappa on port 3000 and uses nginx to provide auth and ssl before proxying to kappa which in turn uses the local couchdb or proxies to the normal public npm registry.


#Setting it up
##Server
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



##Client
```
npm config set strict-ssl false
```

in .bash_profile
```bash
function mpm(){
    npm --registry 'https://username:password@npm.your-domain.com' $@
}
```

finally, you're cooking with gas
```bash
# publish your super secret package
mpm publish
# then later install your super secret package
mpm install super-secret-package
```
