'use strict'


class CvControllerSpec extends ControllerSpec

  test: ->

    fixtures = @fixtures

    beforeEach inject (CvService) ->
      @cvService = CvService
      spyOn(@cvService, 'get').andCallThrough()

      @cv = fixtures.cv.a
      @httpBackend.whenGET(/config.json/).respond fixtures.config.a
      @httpBackend.whenGET(/cv_en.json/).respond fixtures.cv.a

      @CvCtrl = @controller 'CvCtrl', {
        $scope: @scope
        CvService: @cvService
      }

      do @httpBackend.flush


    describe 'initialization', ->

      it 'should call \'cvService.get\' method', () ->
        expect(@cvService.get).toHaveBeenCalled()

      it 'should attach the title of the cv and two parts to the scope', () ->
        expect(@scope.cv.title).toBe 'CV'
        expect(@scope.cv.parts.length).toBe 2
        part1 = @scope.cv.parts[0]
        expect(part1 instanceof CvPart).toBeTruthy()
        expect(part1.title).toBe 'Sección 1'
        expect(part1.content).toBe 'contenido de la sección 1'

      it 'should attach to scope/rootScope info for the header navbar', () ->

        expect(@rootScope.header.nav).toEqual [
          id : 'sec1'
          order : 20,
          title : 'Sección 1'
          href : '#sec1'
        ,
          id : 'sec2'
          order : 21,
          title : 'Sección 2'
          href : '#sec2'
        ]


    describe '\'locale_changed\' event broadcasted', ->
      beforeEach ->
        @rootScope.$broadcast('locale_changed')
        do @httpBackend.flush

      it 'should call \'cvService.get\' method', () ->
        expect(@cvService.get).toHaveBeenCalled()



    afterEach ->
      do @httpBackend.verifyNoOutstandingExpectation
      do @httpBackend.verifyNoOutstandingRequest


describe 'Controller: CvCtrl', () -> do new CvControllerSpec().test


