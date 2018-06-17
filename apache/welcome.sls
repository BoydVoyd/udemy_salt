{% set name = salt.pillar.get(name) %}

welcome_page:
  file.managed: 
    - name: /var/www/html/index.html
    - contents: |
         <!doctype html>
         <body><h1>{{ name }}</h1></body>