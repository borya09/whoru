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

    beforeEach inject ($controller, $rootScope, $httpBackend) ->
      @controller = $controller
      @scope = $rootScope.$new()
      @httpBackend = $httpBackend

