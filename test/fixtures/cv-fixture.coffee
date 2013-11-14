global = exports ? this
global.$FIXTURES = global.$FIXTURES ? {}
global.$FIXTURES.cv =
  a:
    version: '0.0.1'
    parts: [
      title: 'Sección 1'
      key: 'sec1'
      content: 'contenido de la sección 1'
    ,
      title: 'Sección 2'
      key: 'sec2'
      content: 'contenido de la sección 2'
    ]
  part:
    a:
      title:'tit'
      key: 'key'
      description:'desc'
      content:[
        a:1
        b:2
      ]
