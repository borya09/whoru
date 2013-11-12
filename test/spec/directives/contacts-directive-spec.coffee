###
'use strict'

describe 'Directive: whContacts', ->

  html = "<div><wh-contacts data-contacts='contacts'></wh-contacts></div>"

  compileDirective = (compile, scope) ->
    elto = compile(html)(scope)
    scope.$digest()
    elto

  itContactsNotRendered = ->
    it 'should NOT render the list of contacts', ->
      elto = compileDirective(@compile, @scope)

      expect(elto.find('ul').length).toBe 0
      expect(elto.find('.wh-contact').length).toBe 0


  beforeEach module 'whoruApp'

  beforeEach inject ($compile, $rootScope) ->
    @compile = $compile
    @scope = $rootScope.$new()


  describe 'with 4 valid contacts', ->
    beforeEach ->
      @scope.contacts = [
        type: "web"
        value: "http://www.google.es"
        icon: "3"
      ,
        type: "phone"
        value: "666999666"
        icon: "2"
      ,
        type: "mail"
        value: "email@gmail.com"
        icon: "1"
      ,
        type: "web"
        value: "http://www.google2.es"
        icon: "3"
      ]

    it 'should render a list with one phone, two webs, and one mail', ->

      elto = compileDirective(@compile, @scope)

      expect(elto.find('ul').length).toBe 1
      expect(elto.find('.wh-contact').length).toBe 4
      expect(elto.find('.wh-contact.phone').attr('href')).toBe 'tel:666999666'
      expect(elto.find('.wh-contact.web').first().attr('href')).toBe 'http://www.google.es'
      expect(elto.find('.wh-contact.web').last().attr('href')).toBe 'http://www.google2.es'
      expect(elto.find('.wh-contact.mail').attr('href')).toBe 'mailto:email@gmail.com'


  describe 'with NO contacts', ->
    beforeEach ->
      @scope.contacts = [
      ]

    do itContactsNotRendered


  describe 'without contacts', ->
    beforeEach ->
      @scope.contacts = undefined

    do itContactsNotRendered

###
