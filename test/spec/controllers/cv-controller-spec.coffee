'use strict'

describe 'Controller: CvCtrl', () ->
  beforeEach module 'whoruApp'

  beforeEach inject ($controller, $rootScope, $q, cvService) ->
    @cvService = cvService

    cv =
      name: 'borja'
      age: 23

    @cv = cv

    spyOn(@cvService, 'get').andCallFake ->
      @ret = $q.defer()
      @ret.resolve cv
      @ret.promise

    @scope = $rootScope.$new()
    @MainCtrl = $controller 'CvCtrl', {
      $scope: @scope
      cvService: @cvService
    }

  describe 'when init', ->

    it 'should call \'cvService.get\' method', () ->
      do @scope.$apply
      expect(@cvService.get).toHaveBeenCalled()

    it 'should attach the cv to the scope', () ->
      do @scope.$apply
      expect(@scope.cv).toBe @cv