'use strict'

describe 'Controller: ContactsCtrl', () ->


  beforeEach module "whoruApp"

  beforeEach inject ($controller, $rootScope, $httpBackend, ContactsService) ->

    @contactsService = ContactsService
    @httpBackend = $httpBackend
    @controller = $controller

    @scope = $rootScope.$new()

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

      @createController @contacts

    it 'should call \'contactsService.get\' method', () ->
      expect(@contactsService.get).toHaveBeenCalled()

    it 'should attach the cv to the scope', () ->
      expect(@scope.contacts.length).toBe 2




