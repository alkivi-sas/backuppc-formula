{% from "backuppc/map.jinja" import backuppc with context %}

include:
  - backuppc.service

{%- macro backuppc_host(name, config, state='present') -%}
{% if state=='present' %}
backuppc-hosts-{{ name }}:
  file.accumulated:
    - name: backuppc-hosts
    - filename: {{ backuppc.hosts_file }}
    - text: {{ name }} 0
    - require_in:
      - file: backuppc-hosts

backuppc-{{ name }}:
  file.managed:
    - name: /etc/backuppc/{{ name }}.pl
    - source: salt://backuppc/templates/host.pl.jinja
    - template: jinja
    - user: backuppc
    - group: www-data
    - mode: 644
    - context:
      host: {{ name }}
      config: {{ config }}
    - watch_in:
      - service: backuppc
{% else %}
backuppc-{{name}}:
  file.absent:
    - name: /etc/backuppc/{{ name }}.pl
{% endif %}
{%- endmacro -%}
