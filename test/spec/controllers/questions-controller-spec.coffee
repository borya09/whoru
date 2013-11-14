'use strict'

class QuestionsControllerSpec extends ControllerSpec

  test: ->

    fixtures = @fixtures

    # Initialize the controller and a mock scope
    beforeEach inject (QuestionsService) ->

      @questionsService = QuestionsService

      @createController = (json) ->
        @httpBackend.whenGET(/questions.json/).respond json
        @QuestionsCtrl = @controller 'QuestionsCtrl', {
          $scope: @scope
          QuestionsService: @questionsService
        }
        do @httpBackend.flush



    it 'should attach a list of questions with answers to scope', () ->

      @createController fixtures.questions.b

      expect(@scope.questions).not.toBeUndefined()
      expect(@scope.questions.length).toEqual 1


    it 'should transform json data to array with question title', () ->

      @createController fixtures.questions.c

      expect(@scope.questions[0].question).toBe 'hola!'


    it 'should transform json data to array with options', () ->

      @createController fixtures.questions.d

      expect(@scope.questions[0].options.length).toEqual 5

    it 'should transform json data to options with ttle', () ->

      @createController fixtures.questions.e

      expect(@scope.questions[0].options[0].title).toBe 'pedro'
      expect(@scope.questions[0].options[1].title).toBe 'juan'


    it 'should transform json data with multiple to false to options with same name', () ->

      @createController fixtures.questions.f

      expect(@scope.questions[0].options[0].name).toBe 'hola!'
      expect(@scope.questions[0].options[1].name).toBe 'hola!'

    it 'should transform json data with multiple options with diferents names', () ->

      @createController fixtures.questions.g

      expect(@scope.questions[0].options[0].name).toBe 'pedro'
      expect(@scope.questions[0].options[1].name).toBe 'juan'


    it 'should transform json data with multiple options with diferents names', () ->

      @createController fixtures.questions.h

      expect(@scope.questions[0].options[0].name).toBe 'pedro'
      expect(@scope.questions[0].options[1].name).toBe 'juan'


    it 'should transform json data with multiple to checkbox and not multiple to radio', () ->

      @createController fixtures.questions.i

      expect(@scope.questions[0].type).toBe 'radio'
      expect(@scope.questions[1].type).toBe 'checkbox'


    it 'shoud transform json data with boolean answers to number (0 o 100)', () ->

      @createController fixtures.questions.j

      expect(@scope.questions[0].options[0].pondered).toEqual 0
      expect(@scope.questions[0].options[1].pondered).toEqual 100

    afterEach ->
      do @httpBackend.verifyNoOutstandingExpectation
      do @httpBackend.verifyNoOutstandingRequest

describe 'Controller: QuestionsCtrl', () -> do new QuestionsControllerSpec().test
