{% from "backuppc/map.jinja" import backuppc with context %}

include:
  - backuppc.service

backuppc-config:
  file.managed:
    - name: {{ backuppc.config_file }}
    - source: salt://backuppc/templates/config.pl.jinja
    - template: jinja
    - user: backuppc
    - group: www-data
    - mode: 644
    - context:
      config: {{ backuppc.config | yaml() }}
    - watch_in:
      - service: backuppc

backuppc-hosts:
  file.managed:
    - name: {{ backuppc.hosts_file }}
    - source: salt://backuppc/templates/hosts.jinja
    - template: jinja
    - user: backuppc
    - group: www-data
    - mode: 644
    - watch_in:
      - service: backuppc
