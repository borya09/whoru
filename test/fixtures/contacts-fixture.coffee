global = exports ? this
global.$FIXTURES = global.$FIXTURES ? {}
global.$FIXTURES.contacts =
  a:
    version: "0.0.1",
    title:"Contacts"
    header:"Contacts2"
    contacts: [
      type: "web"
      value: "http://www.google.com"
      icon: "Z"
    ,
      type: "web"
      value: "https://github.com/"
      icon: "t"
    ]
