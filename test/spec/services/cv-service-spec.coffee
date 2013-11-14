'use strict'

class CvServiceSpec extends ServiceSpec

  test: ->

    fixtures = @fixtures

    beforeEach inject (CvService) ->
      @cvService = CvService

    describe '\'get\' method, when called', ->
      beforeEach ->
        @cv = fixtures.cv.a
        @httpBackend.whenGET(/config.json/).respond fixtures.config.a
        @httpBackend.whenGET(/cv_en.json/).respond @cv

      it 'should GET \'cv_es.json\' file', ->
        @httpBackend.expectGET(/cv_en.json$/).respond @cv
        @cvService.get()
        do @httpBackend.flush

      it 'should return an array of two CvPart\'s', ->
        cv = {}

        @cvService.get()
          .then (data) ->
            cv = data

        do @httpBackend.flush


        expect(typeof cv).toBe 'object'
        expect(cv.length).toBe 2

        part1 = cv[0]
        expect(part1 instanceof CvPart).toBeTruthy()
        expect(part1.title).toBe 'Sección 1'
        expect(part1.content).toBe 'contenido de la sección 1'

    afterEach ->
      do @httpBackend.verifyNoOutstandingExpectation
      do @httpBackend.verifyNoOutstandingRequest

describe 'Service: CvService', () -> do new CvServiceSpec().test