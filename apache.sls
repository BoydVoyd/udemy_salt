{% set apache = salt.grains.filter_by({
    'Debian': {
       'pkg': 'apache2'
       'srv': 'apache2'
    },
    'RedHat': {
       'pkg': 'httpd'
       'srv': 'httpd'
    },
}) %}

install_apache:
  pkg.installed:
    - name: {{ apache.pkg }}

start_apache:
  service.running:
    - name: {{ apache.pkg }}
    - enable: True

welcome_page:
  file.managed: 
    - name: /var/www/html/index.html
    - contents: |
         <!doctype html>
         <body><h1>Hello World!</h1></body>
