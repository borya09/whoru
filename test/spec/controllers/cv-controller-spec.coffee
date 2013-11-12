'use strict'

describe 'Controller: CvCtrl', () ->

  beforeEach module "whoruApp"

  beforeEach inject ($controller, $rootScope, $httpBackend, CvService) ->

    @cvService = CvService
    @httpBackend = $httpBackend
    @controller = $controller

    @scope = $rootScope.$new()

    spyOn(@cvService, 'get').andCallThrough()

    @createController = (json) ->

      @httpBackend.whenGET(/cv.json/).respond(json)

      @CvCtrl = @controller 'CvCtrl', {
        $scope: @scope
        CvService: @cvService
      }

      do @httpBackend.flush


  describe 'initialization', ->

    beforeEach ->
      @cv =
        version: '0.0.1'
        parts: [
          title: 'Sección 1'
          key: 'sec1'
          content: 'contenido de la sección 1'
        ,
          title: 'Sección 2'
          key: 'sec2'
          content: 'contenido de la sección 2'
        ]

      @createController @cv

    it 'should call \'cvService.get\' method', () ->
      expect(@cvService.get).toHaveBeenCalled()

    it 'should attach the cv to the scope', () ->
      expect(@scope.cv.length).toBe 2

      part1 = @scope.cv[0]
      expect(part1 instanceof CvPart).toBeTruthy()
      expect(part1.title).toBe 'Sección 1'
      expect(part1.content).toBe 'contenido de la sección 1'




