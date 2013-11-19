class ControllerSpec

  constructor: ->

    @fixtures = global.$FIXTURES

    beforeEach module("whoruApp", ($provide) ->
      $provide.value 'CV_REQUIRED_FIELDS', [
        'name'
        'description'
      ]
      undefined
    )

    beforeEach inject ($controller, $rootScope, $httpBackend, $q) ->
      @controller = $controller
      @scope = $rootScope.$new()
      @rootScope = $rootScope
      @httpBackend = $httpBackend
      @q = $q

      @rootScope.header = {}
      @rootScope.header.nav = []



