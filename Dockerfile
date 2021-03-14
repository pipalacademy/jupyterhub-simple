FROM jupyterhub/jupyterhub:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && apt-get -y install python3-pip python3-dev libzmq3-dev libxml2-dev libxslt-dev
RUN python3 -m pip install notebook jupyterlab
ADD src /opt/jhub
CMD ["bash", "-c", "python3 /opt/jhub/add-users.py /srv/jupyterhub/users.txt && jupyterhub --no-ssl"]
