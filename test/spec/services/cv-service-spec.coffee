'use strict'

describe 'Service: cvService', ->
  beforeEach module 'whoruApp'

  beforeEach inject((cvService, $httpBackend) ->
    @cvService = cvService
    @$httpBackend = $httpBackend
  )

  describe '\'get\' method', ->
    beforeEach ->
      @cv =
        name: 'borja'
        age: 23

      @$httpBackend.when('GET', /cv.json$/).respond @cv

    it 'should return cv json object', ->
      cv = {}

      @cvService.get()
        .then (data) ->
          cv = data

      do @$httpBackend.flush

      expect(cv).toEqual @cv

    afterEach ->
      do @$httpBackend.verifyNoOutstandingExpectation
      do @$httpBackend.verifyNoOutstandingRequest

