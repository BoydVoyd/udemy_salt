{% set lookup ={
    'jerry': "Jerry's World",
    'stewart': "Stewart's World", 
    'master': "Master's World", 
}%}

{% set name = lookup[grains.id] %}

name: {{ name | json() }}