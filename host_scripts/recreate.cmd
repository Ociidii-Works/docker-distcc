docker kill distcc-server-local
docker rm distcc-server-local
rem docker build ..\ --tag=distcc-local
rem docker run -p 3632:3632 --name distcc-server-local distcc-local
docker-compose up --force-recreate --build