'use strict'


class IntroServiceSpec extends ServiceSpec

  test: ->

    fixtures = @fixtures

    beforeEach inject (IntroService) ->
      @introService = IntroService


    describe '\'get\' method, when called', ->
      beforeEach ->
        @intro = fixtures.intro.a
        @httpBackend.whenGET(/config.json/).respond fixtures.config.a
        @httpBackend.when('GET', /intro_en.json$/).respond @intro


      it 'should GET \'intro_en.json\' file', ->
        @httpBackend.expectGET(/intro_en.json$/).respond @intro
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
        expect(intro.title).toBe 'intro'

    afterEach ->
      do @httpBackend.verifyNoOutstandingExpectation
      do @httpBackend.verifyNoOutstandingRequest

describe 'Service: IntroService', () -> do new IntroServiceSpec().test

