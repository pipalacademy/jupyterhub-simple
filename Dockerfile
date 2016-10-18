FROM jupyterhub/jupyterhub:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && apt-get -y install python-pip python-dev libzmq3-dev libxml2-dev libxslt-dev
RUN pip install notebook
ADD src /opt/jhub
CMD ["bash", "-c", "python /opt/jhub/add-users.py /srv/jupyterhub/users.txt && jupyterhub --no-ssl"]
