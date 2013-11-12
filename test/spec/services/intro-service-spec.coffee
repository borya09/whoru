'use strict'

describe 'Service: IntroService', ->

  beforeEach module 'whoruApp'

  beforeEach inject (IntroService, $httpBackend) ->
    @introService = IntroService
    @httpBackend = $httpBackend


  describe '\'get\' method, when called', ->
    beforeEach ->
      @intro =
        version: "0.0.1"
        intro:
          name: "borja"
          surname1: "andres"

      @httpBackend.when('GET', /intro.json$/).respond @intro


    it 'should GET \'intro.json\' file', ->
      @httpBackend.expectGET(/intro.json$/).respond @intro
      @introService.get()
      do @httpBackend.flush

    it 'should return an Intro object with data', ->
      intro = {}

      @introService.get()
        .then (data) ->
          intro = data

      do @httpBackend.flush


      expect(intro instanceof Intro).toBeTruthy()
      expect(intro.name).toBe 'borja'

    afterEach ->
      do @httpBackend.verifyNoOutstandingExpectation
      do @httpBackend.verifyNoOutstandingRequest

