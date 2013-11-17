'use strict'



class IntroControllerSpec extends ControllerSpec

  test: ->

    fixtures = @fixtures


    beforeEach inject (IntroService) ->
      @introService = IntroService
      spyOn(@introService, 'get').andCallThrough()

      @createController = (json) ->

        @httpBackend.whenGET(/config.json/).respond fixtures.config.a
        @httpBackend.whenGET(/intro_en.json/).respond json

        @IntroCtrl = @controller 'IntroCtrl', {
          $scope: @scope
          IntroService: @introService
        }

        do @httpBackend.flush


    describe 'initialization', ->

      describe 'with correct intro', ->

        fixture = undefined

        beforeEach ->
          fixture = fixtures.intro.a

          @createController fixture

        it 'should call \'introService.get\' method', () ->
          expect(@introService.get).toHaveBeenCalled()

        it 'should attach the intro to the scope', () ->
          expect(@scope.intro.name).toBe fixture.intro.name
          expect(@scope.intro.age).toBe fixture.intro.age
          expect(@scope.intro.description).toBe fixture.intro.description

        it 'should attach to scope/rootScope info for the header navbar', () ->
          expect(@scope.id).toBe 'intro'
          expect(@rootScope.nav).toEqual [
            order : 1
            title : fixture.intro.name + ' ' + fixture.intro.surname1
            href : '#intro'
          ]


      describe 'with NO correct intro', ->

        beforeEach ->
          fixture = fixtures.intro.b

          @error = undefined

          try
            @createController fixture
          catch e
            @error = e.message

        it 'should throw an exception', () ->

          expect(@error).toMatch('- name')
          expect(@error).toMatch('- description')


describe 'Controller: IntroCtrl', () -> do new IntroControllerSpec().test


