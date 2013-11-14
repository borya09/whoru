'use strict'

class ContanctsServiceSpec extends ServiceSpec

  test: ->

    fixtures = @fixtures

    beforeEach inject (ContactsService) ->
      @contactsService = ContactsService


    describe '\'get\' method, when called', ->

      beforeEach ->
        @contacts = fixtures.contacts.a
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

describe 'Service: ContactsService', () -> do new ContanctsServiceSpec().test