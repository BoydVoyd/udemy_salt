{% set name = salt.pillar.get('name') %}

check_pillar_values:
  test.check_pillar:
    - present:
      - nameX
    - failhard: True

welcome_page:
  file.managed: 
    - name: /var/www/html/index.html
    - contents: |
         <!doctype html>
         <body><h1>{{ name }}</h1></body>