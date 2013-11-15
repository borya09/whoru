'use strict'

class QuestionsServiceSpec extends ServiceSpec

  test: ->

    fixtures = @fixtures

    beforeEach inject (QuestionsService) ->
      @questionsService = QuestionsService

    describe '\'get\' method, when called', ->

      beforeEach ->
        @questions = fixtures.questions.a
        @httpBackend.whenGET(/config.json/).respond fixtures.config.a
        @httpBackend.whenGET(/questions_en.json/).respond @questions

      it 'should GET \'questions_en.json\' file', ->
        @httpBackend.expectGET(/questions_en.json/).respond @questions
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

describe 'Service: QuestionsService', () -> do new QuestionsServiceSpec().test


