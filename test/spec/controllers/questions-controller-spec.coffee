'use strict'

class QuestionsControllerSpec extends ControllerSpec

  test: ->

    fixtures = @fixtures

    # Initialize the controller and a mock scope
    beforeEach inject (QuestionsService) ->

      @questionsService = QuestionsService

      @createController = (fixture) ->

        @httpBackend.whenGET(/config.json/).respond fixtures.config.a
        @httpBackend.whenGET(/questions_en.json/).respond fixture

        spyOn(@questionsService, 'get').andCallThrough()

        @QuestionsCtrl = @controller 'QuestionsCtrl', {
          $scope: @scope
          QuestionsService: @questionsService
        }
        do @httpBackend.flush


    describe 'initialization', ->

      it 'should call \'questionsService.get\' method', () ->
        @createController fixtures.questions.b

        expect(@questionsService.get).toHaveBeenCalled()


      it 'should attach a list of questions with answers to scope', () ->
        @createController fixtures.questions.b

        expect(@scope.questions).not.toBeUndefined()
        expect(@scope.questions.length).toEqual 1

      it 'should attach to scope/rootScope info for the header navbar', () ->
        @createController fixtures.questions.b

        expect(@scope.id).toBe 'questions'
        expect(@rootScope.nav).toEqual [
          order: 3
          title : 'questions json'
          href : '#questions'
        ]

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


    describe '\'locale_changed\' event broadcasted', ->
      beforeEach ->
        @createController fixtures.questions.c
        @rootScope.$broadcast('locale_changed')
        do @httpBackend.flush

      it 'should call \'questionsService.get\' method', () ->
        expect(@questionsService.get).toHaveBeenCalled()


    afterEach ->
      do @httpBackend.verifyNoOutstandingExpectation
      do @httpBackend.verifyNoOutstandingRequest

describe 'Controller: QuestionsCtrl', () -> do new QuestionsControllerSpec().test
