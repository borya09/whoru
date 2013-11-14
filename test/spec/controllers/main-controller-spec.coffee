'use strict'


class MainControllerSpec extends ControllerSpec

  test: ->

    fixtures = @fixtures

    beforeEach inject (DataTranslatorService) ->
      @dataTranslatorService = DataTranslatorService

      @createController = () ->

        @httpBackend.whenGET(/config.json/).respond({})

        spyOn(@dataTranslatorService, 'getAvailablesLocales').andCallFake =>
          deferred = @q.defer()
          deferred.resolve fixtures.config.b.locales
          deferred.promise

        spyOn(@dataTranslatorService, 'setLocale').andCallFake ->
          undefined

        spyOn(@rootScope, '$broadcast').andCallFake ->
          undefined

        new @controller 'MainCtrl',
          $scope: @scope
          $rootScope: @rootScope
          DataTranslatorService: @dataTranslatorService

        #resolve 'dataTranslatorService.getAvailablesLocales' promise
        @rootScope.$apply()



    describe 'when init', ->
      beforeEach ->
        do @createController

      it 'should call \'dataTranslatorService.getAvailablesLocales\' method', () ->
        expect(@dataTranslatorService.getAvailablesLocales).toHaveBeenCalled()

      it 'should attach the locales to the scope', () ->
        expect(@scope.locales).toBe fixtures.config.b.locales

    describe '\'$scope.setLocale\' method', ->

      locale = fixtures.config.c

      beforeEach ->
        do @createController
        @scope.setLocale locale

      it 'should call \'dataTranslatorService.setLocale\' method with given locale', () ->
        expect(@dataTranslatorService.setLocale).toHaveBeenCalledWith locale

      it 'should broadcast event \'locale_changed\'', () ->
        expect(@rootScope.$broadcast).toHaveBeenCalledWith 'locale_changed'


describe 'Controller: MainCtrl', () -> do new MainControllerSpec().test





