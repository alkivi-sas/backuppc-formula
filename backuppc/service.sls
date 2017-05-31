# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "backuppc/map.jinja" import backuppc with context %}

backuppc:
  service.running:
    - name: {{ backuppc.service }}
    - enable: True
