global = exports ? this
global.$FIXTURES = global.$FIXTURES ? {}
global.$FIXTURES.config =
  a:
    config:
      locales: [
        "default": true
        key: "en"
      ]
  b:
    locales: [
      "default": true
      key: "en"
    ,
      key: "es"
    ]
  c:
    actual: true
    text: 'EN'
    key: "en"
  d:
    version: "0.0.1"
    config:
      locales: [
        key: "es"
        image: "image1"
        text: "ES"
      ,
        "default":true
        key: "en"
        image: "image2"
        text: "EN"
      ]

  e:
    version: "0.0.1"
    config:
      locales: []


