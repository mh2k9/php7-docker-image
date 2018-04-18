 # php7-docker-image

Apache2 with php7 on Ubuntu 16.04 LTS
--

This image is with Ubuntu 16.04 LTS with apache2, php7 and composer

We should map the `/var/www/html` to access the app contents from outside the docker container.
Examples
----

`$ docker run -d -h app -v $(pwd):/var/www/html -p 80:80 --name php7 csemahadi/php7 > /dev/null`

- `-p 80:80` is publish the container’s port(80) to the host
- `-d` flag means run container in the background
- `-h` flag means hostname
- `-v` flag is for mounting current working directory
- `--name php7` is the container name is php7

To run commands or edit settings inside the container run the following command:
`$ docker exec -it php7 bash`
