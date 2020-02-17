## docker wrapper for d2rq

### why

- just wrapping https://github.com/d2rq/d2rq for quick usage


### how

- this example assumes you have a mysql db with a user "root"

- exec into container

- `./generate-mapping --verbose  -u root  -o /mnt/dbname.ttl jdbc:mysql://172.17.0.1:3306/dbname`

- then edit /mnt/dbname.ttl and delete the table mapping you don't want

- `./dump-rdf --verbose  -o /mnt/dump.nt /mnt/dbname.ttl` 

