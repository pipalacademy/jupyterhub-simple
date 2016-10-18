# jupyterhub-simple

Ready to use Docker Image for running jupyterhub.

The official jupyterhub image requires lot of configuration to get started. This image provides ready to use docker image for simple use cases.

The main differences are:

* Adds required dependencies to run single-user notebook servers from the same
  container.
* Provides a script to add users. The script expects username:password for
  every user to be present in `/srv/jupyterhub/users.txt` file.
* Starts without SSL (expects you to put it behind nginx+SSL)

## Usage

The jupyterhub-simple docker image can be started with the following command:

    docker run -p 8000:8000 pipalacademy/jupyterhub-simple 

That starts jupyterhub running on port 8000. 

To add some users, create `users.txt` file with the following format:

    alice:alice123
    bob:bob000

And mount it when running the container.

    docker run -p 8000:8000 -v $PWD/users.txt:/srv/jupyterhub/users.txt pipalacademy/jupyterhub-simple

You may also want to persist the notebooks created by users by mounting /home as volume.

 
    docker run -p 8000:8000 \
        -v $PWD/users.txt:/srv/jupyterhub/users.txt \
        -v $PWD/home:/home \
        pipalacademy/jupyterhub-simple

