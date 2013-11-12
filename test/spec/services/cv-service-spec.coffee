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
        sections: [
          title: 'Sección 1'
          key: 'sec1'
          content: 'contenido de la sección 1'
        ,
          title: 'Sección 2'
          key: 'sec2'
          content: 'contenido de la sección 2'
        ]

      @httpBackend.when('GET', /cv.json$/).respond @cv

    it 'should GET \'cv.json\' file', ->
      @httpBackend.expectGET(/cv.json$/).respond @cv
      @cvService.get()
      do @httpBackend.flush

    it 'should return an array of two CvSection\'s', ->
      cv = {}

      @cvService.get()
        .then (data) ->
          cv = data

      do @httpBackend.flush


      expect(typeof cv).toBe 'object'
      expect(cv.length).toBe 2

      section1 = cv[0]
      expect(section1 instanceof CvSection).toBeTruthy()
      expect(section1.title).toBe 'Sección 1'
      expect(section1.content).toBe 'contenido de la sección 1'

    afterEach ->
      do @httpBackend.verifyNoOutstandingExpectation
      do @httpBackend.verifyNoOutstandingRequest

