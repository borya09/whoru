'use strict'

describe 'Service: ContactsService', () ->

  beforeEach module 'whoruApp'

  beforeEach inject (ContactsService, $httpBackend) ->
    @contactsService = ContactsService
    @httpBackend = $httpBackend


  describe '\'get\' method, when called', ->

    beforeEach ->
      @contacts =
        version: "0.0.1"
        contacts: [
          type: "web"
          value: "http://www.as.com"
          icon: "Z"
        ,
          type: "web"
          value: "https://github.com/borya09/"
          icon: "t"
        ]

      @httpBackend.when('GET', /contacts.json$/).respond @contacts

    it 'should GET \'contacts.json\' file', ->
      @httpBackend.expectGET(/contacts.json$/).respond @contacts
      @contactsService.get()
      do @httpBackend.flush

    it 'should return an an object with title and an array of two questions', ->
      contacts = {}

      @contactsService.get()
        .then (data) ->
          contacts = data

      do @httpBackend.flush

      expect(contacts instanceof Object).toBeTruthy()
      expect(contacts.length).toBe 2

    afterEach ->
      do @httpBackend.verifyNoOutstandingExpectation
      do @httpBackend.verifyNoOutstandingRequest
