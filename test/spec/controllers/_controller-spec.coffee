class ControllerSpec

  constructor: ->

    @fixtures = global.$FIXTURES

    beforeEach module("whoruApp", ->
      undefined
    )

    beforeEach inject ($controller, $rootScope, $httpBackend, $q) ->
      @controller = $controller
      @scope = $rootScope.$new()
      @rootScope = $rootScope
      @httpBackend = $httpBackend
      @q = $q

      @rootScope.header = {}
      @rootScope.header.nav = {}
      @rootScope.header.nav.options = []



