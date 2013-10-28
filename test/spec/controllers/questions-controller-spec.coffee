'use strict'

describe 'Controller: QuestionsCtrl', () ->
  # load the controller's module
  beforeEach module 'whoruApp'
  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, $log, questionsService, $httpBackend) ->
    @scope = $rootScope.$new()
    @questionsService = questionsService
    #spyOn(@questionsService, 'load').andCallFake ->
    @httpBackend = $httpBackend
    @log = $log
    @controller = $controller
    @createController = (json) ->
      @httpBackend.expectGET('/data/questions.json').respond(json)
      @QuestionsCtrl = @controller 'QuestionsCtrl', {
        $scope: @scope
        $log: @log
        questionsService: @questionsService
      }
      do @httpBackend.flush

  # questions.json with one question

  it 'should attach a list of questions with answers to scope', () ->
    jsonData =
      title: 'questions json'
      version: '1.0.0'
      questions: [
        title: "hola!"
        multiple: false
        answers:
          pedro: 0
          juan: 100
      ]

    @createController jsonData

    expect(@scope.questions).not.toBeUndefined()
    expect(@scope.questions.length).toEqual 1

  it 'should transform json data to array with question title', () ->
    jsonData =
      title: 'questions json'
      version: '1.0.0'
      questions: [
        title: "hola!"
        multiple: false
        answers:
          pedro: 0
          juan: 100
      ]

    @createController jsonData

    expect(@scope.questions[0].question).toBe 'hola!'

  it 'should transform json data to array with options', () ->
    jsonData =
      title: 'questions json'
      version: '1.0.0'
      questions: [
        title: "hola!"
        multiple: false
        answers:
          pedro: 0
          juan: 10
          julio: 20
          marco: 30
          marta: 40
      ]

    @createController jsonData

    expect(@scope.questions[0].options.length).toEqual 5

  it 'should transform json data to options with ttle', () ->
    jsonData =
      title: 'questions json'
      version: '1.0.0'
      questions: [
        title: "hola!"
        multiple: false
        answers:
          pedro: 0
          juan: 100
      ]

    @createController jsonData

    expect(@scope.questions[0].options[0].title).toBe 'pedro'
    expect(@scope.questions[0].options[1].title).toBe 'juan'

  it 'should transform json data with multiple to false to options with same name', () ->
    jsonData =
      title: 'questions json'
      version: '1.0.0'
      questions: [
        title: "hola!"
        multiple: false
        answers:
          pedro: 0
          juan: 100
      ]

    @createController jsonData

    expect(@scope.questions[0].options[0].name).toBe 'hola!'
    expect(@scope.questions[0].options[1].name).toBe 'hola!'

  it 'should transform json data with multiple options with diferents names', () ->
    jsonData =
      title: 'questions json'
      version: '1.0.0'
      questions: [
        title: "hola!"
        multiple: true
        answers:
          pedro: 0
          juan: 100
      ]

    @createController jsonData

    expect(@scope.questions[0].options[0].name).toBe 'pedro'
    expect(@scope.questions[0].options[1].name).toBe 'juan'

  it 'should transform json data with multiple options with diferents names', () ->
    jsonData =
      title: 'questions json'
      version: '1.0.0'
      questions: [
        title: "hola!"
        multiple: true
        answers:
          pedro: 0
          juan: 100
      ]

    @createController jsonData

    expect(@scope.questions[0].options[0].name).toBe 'pedro'
    expect(@scope.questions[0].options[1].name).toBe 'juan'

  it 'should transform json data with multiple to checkbox and not multiple to radio', () ->
    jsonData =
      title: 'questions json'
      version: '1.0.0'
      questions: [
        title: "hola!"
        multiple: false
        answers:
          pedro: 0
          juan: 10
          julio: 20
          marco: 30
          marta: 40
      ,
        title: 'bye'
        multiple: true
        answers:
          hola: 0
          adios: 100
      ]

    @createController jsonData

    expect(@scope.questions[0].type).toBe 'radio'
    expect(@scope.questions[1].type).toBe 'checkbox'

  it 'shoud transform json data with boolean answers to number (0 o 100)', () ->
    jsonData =
      title: 'questions json'
      version: '1.0.0'
      questions: [
        title: "hola!"
        multiple: false
        answers:
          pedro: false,
          luis: true
      ]

    @createController jsonData

    expect(@scope.questions[0].options[0].pondered).toEqual 0
    expect(@scope.questions[0].options[1].pondered).toEqual 100