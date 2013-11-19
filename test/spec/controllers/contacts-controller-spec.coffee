'use strict'


class ContactsControllerSpec extends ControllerSpec

  test: ->

    fixtures = @fixtures

    beforeEach inject (ContactsService) ->
      @contactsService = ContactsService
      spyOn(@contactsService, 'get').andCallThrough()


      @createController = (json) ->
        @httpBackend.whenGET(/contacts.json/).respond(json)
        @ContactsCtrl = @controller 'ContactsCtrl', {
          $scope: @scope
          ContactsService: @contactsService
        }
        do @httpBackend.flush


    describe 'initialization', ->
      beforeEach ->
        @contacts = fixtures.contacts.a
        @createController @contacts

      it 'should call \'contactsService.get\' method', () ->
        expect(@contactsService.get).toHaveBeenCalled()

      it 'should attach an array of conctacs to the scope', () ->
        expect(@scope.contacts.length).toBe 2

      it 'should attach the title the scope', () ->
        expect(@scope.title).toBe 'Contacts'

      it 'should attach to scope/rootScope info for the header navbar', () ->
        expect(@scope.id).toBe 'contacts'
        expect(@rootScope.header.nav).toEqual [
          id : 'contacts'
          order : 50
          title : @contacts.title
          href : '#contacts'
        ]

    afterEach ->
      do @httpBackend.verifyNoOutstandingExpectation
      do @httpBackend.verifyNoOutstandingRequest


describe 'Controller: ContactsCtrl', () -> do new ContactsControllerSpec().test





