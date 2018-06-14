install_apache:
  pkg.installed:
    {% if salt.grains.get('os_famil') == 'Debian' %}
    - name: apache2
    {% elif salt.grains.get('os_famil') == 'RedHat' %}
    -name: httpd
    {% endif %}
start_apache:
  service.running:
    {% if salt.grains.get('os_famil') == 'Debian' %}
    - name: apache2
    {% elif salt.grains.get('os_famil') == 'RedHat' %}
    -name: httpd
    {% endif %}
    - enable: True

welcome_page:
  file.managed: 
    - name: /var/www/html/index.html
    - contents: |
         <!doctype html>
         <body><h1>Hello World!</h1></body>
