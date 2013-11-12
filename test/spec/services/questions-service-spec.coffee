'use strict'

describe 'Service: QuestionsService', () ->

  beforeEach module 'whoruApp'

  beforeEach inject (QuestionsService, $httpBackend) ->
    @questionsService = QuestionsService
    @httpBackend = $httpBackend


  describe '\'get\' method, when called', ->
    beforeEach ->
      @questions =
        version: "0.0.1"
        title:"titulo"
        questions:[{
          title: "pregunta 1"
          multiple: true
        },{
          title: "pregunta 2"
          multiple: false
        },]

      @httpBackend.when('GET', /questions.json$/).respond @questions

    it 'should GET \'questions.json\' file', ->
      @httpBackend.expectGET(/questions.json$/).respond @questions
      @questionsService.get()
      do @httpBackend.flush


    it 'should return an an object with title and an array of two questions', ->
      questions = {}

      @questionsService.get()
        .then (data) ->
          questions = data

      do @httpBackend.flush

      expect(questions instanceof Object).toBeTruthy()
      expect(questions.title).toBe 'titulo'
      expect(questions.questions.length).toBe 2

    afterEach ->
      do @httpBackend.verifyNoOutstandingExpectation
      do @httpBackend.verifyNoOutstandingRequest
