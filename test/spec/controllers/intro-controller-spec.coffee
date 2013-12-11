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

      fixture = undefined

      beforeEach ->
        fixture = fixtures.intro.a

        @createController fixture

      it 'should call \'introService.get\' method',  ->
        expect(@introService.get).toHaveBeenCalled()

      it 'should attach the intro to the scope', ->
        expect(@scope.intro.name).toBe fixture.intro.name
        expect(@scope.intro.age).toBe fixture.intro.age
        expect(@scope.intro.description).toBe fixture.intro.description

      it 'should attach to scope/rootScope info for the header navbar', ->
        option =
          id : 'intro'
          order : 10
          title : fixture.header
          href : '#intro'
          hidden : false

        expect(@scope.id).toBe 'intro'
        expect(@rootScope.header.nav.init).toEqual option
        expect(@rootScope.header.nav.options).toEqual [option]


      it 'should attach to rootScope the title', ->

        expect(@rootScope.title).toEqual 'title'


    describe '\'locale_changed\' event broadcasted', ->
      fixture = undefined

      beforeEach ->
        fixture = fixtures.intro.a
        @createController fixture
        @rootScope.$broadcast('locale_changed')
        do @httpBackend.flush

      it 'should call \'introService.get\' method', () ->
        expect(@introService.get).toHaveBeenCalled()

describe 'Controller: IntroCtrl', () -> do new IntroControllerSpec().test


