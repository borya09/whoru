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

      it 'should attach the cv to the scope', () ->
        expect(@scope.contacts.length).toBe 2

    afterEach ->
      do @httpBackend.verifyNoOutstandingExpectation
      do @httpBackend.verifyNoOutstandingRequest


describe 'Controller: ContactsCtrl', () -> do new ContactsControllerSpec().test





