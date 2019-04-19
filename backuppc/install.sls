# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "backuppc/map.jinja" import backuppc with context %}

backuppc-pkgs:
  pkg.installed:
    - pkgs: {{ backuppc.pkgs|tojson }}
