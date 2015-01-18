base:
  pkgrepo.managed:
    - humanname: Docker PPA
    - name: deb https://get.docker.com/ubuntu docker main
    - file: /etc/apt/sources.list.d/docker.list
    - keyid: 36A1D7869245C8950F966E92D8576A8BA88D21E9
    - keyserver: keyserver.ubuntu.com 
    - require_in:
      - pkg: lxc-docker

lxc-docker:
  pkg.installed

python-pip:
  pkg.installed

docker-py:
  pip.installed:
    - require:
      - pkg: python-pip

docker-service:
  service.running:
    - name: docker
    - enable: True
