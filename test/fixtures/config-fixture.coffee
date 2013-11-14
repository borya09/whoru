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
