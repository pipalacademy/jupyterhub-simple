FROM jupyterhub/jupyterhub:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && apt-get -y install python3-pip python3-dev libzmq3-dev libxml2-dev libxslt-dev net-tools dnsutils zip unzip
RUN python3 -m pip install notebook jupyterlab
ADD src /opt/jhub
CMD ["bash", "-c", "python3 /opt/jhub/add-users.py /srv/jupyterhub/users.txt && python3 /opt/jhub/pip-install.py /srv/jupyterhub/requirements.txt && jupyterhub --no-ssl"]
