'use strict'

describe 'Service: CvService', ->
  beforeEach module 'whoruApp'

  beforeEach inject (CvService, $httpBackend) ->
    @cvService = CvService
    @httpBackend = $httpBackend


  describe '\'get\' method, when called', ->
    beforeEach ->
      @cv =
        version: '0.0.1'
        parts: [
          title: 'Sección 1'
          key: 'sec1'
          content: 'contenido de la sección 1'
        ,
          title: 'Sección 2'
          key: 'sec2'
          content: 'contenido de la sección 2'
        ]

      #TODO: Put this method in a helper file for unit testing
      @httpBackend.whenGET(/_config.json/).respond(
        config:
          locales: [
            "default": true
            "key": "en"
          ]
      )

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

