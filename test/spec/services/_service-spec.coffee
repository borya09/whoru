class ServiceSpec

  constructor: ->

    @fixtures = global.$FIXTURES

    beforeEach module 'whoruApp'

    beforeEach inject ($httpBackend) ->
      @httpBackend = $httpBackend

