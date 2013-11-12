'use strict'

describe 'Controller: IntroCtrl', () ->


  beforeEach module("whoruApp", ($provide) ->
    $provide.value 'CV_REQUIRED_FIELDS', [
        'name'
        'description'
      ]
    undefined
  )

  beforeEach inject ($controller, $rootScope, $httpBackend, IntroService) ->

    @introService = IntroService
    @httpBackend = $httpBackend
    @controller = $controller

    @scope = $rootScope.$new()

    spyOn(@introService, 'get').andCallThrough()


    @createController = (json) ->

      @httpBackend.whenGET(/intro.json/).respond
        intro:json

      @IntroCtrl = @controller 'IntroCtrl', {
        $scope: @scope
        IntroService: @introService
      }

      do @httpBackend.flush


  describe 'initialization', ->

    describe 'with correct intro', ->

      intro = undefined

      beforeEach ->
        intro =
          name: 'borja'
          age: 23
          description: 'desc!!!'

        @createController intro

      it 'should call \'introService.get\' method', () ->
        expect(@introService.get).toHaveBeenCalled()

      it 'should attach the intro to the scope', () ->
        expect(@scope.intro.name).toBe intro.name
        expect(@scope.intro.age).toBe intro.age
        expect(@scope.intro.description).toBe intro.description


    describe 'with NO correct intro', ->

      beforeEach ->
        intro =
          nameee: 'borja'
          age: 23

        @error = undefined

        try
          @createController intro
        catch e
          @error = e.message

      it 'should throw an exception', () ->

        expect(@error).toMatch('- name')
        expect(@error).toMatch('- description')


