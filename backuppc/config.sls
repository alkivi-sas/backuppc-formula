include:
  - backuppc.service

{% from "backuppc/map.jinja" import backuppc with context %}

backuppc-config:
  file.managed:
    - name: {{ backuppc.config_file }}
    - source: salt://backuppc/templates/config.pl.jinja
    - template: jinja
    - user: backuppc
    - group: www-data
    - mode: 644
    - context:
      config: {{ backuppc.config }}
    - watch_in:
      - service: backuppc
