'use strict'

class ContactsServiceSpec extends ServiceSpec

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

      it 'should return an object with title and an array of two contacts', ->
        contacts = {}
        title = undefined

        @contactsService.get()
          .then (data) ->
            contacts = data.contacts
            title = data.header

        do @httpBackend.flush

        expect(contacts instanceof Object).toBeTruthy()
        expect(contacts.length).toBe 2
        expect(title).toBe 'Contacts'

    afterEach ->
      do @httpBackend.verifyNoOutstandingExpectation
      do @httpBackend.verifyNoOutstandingRequest

describe 'Service: ContactsService', () -> do new ContactsServiceSpec().test