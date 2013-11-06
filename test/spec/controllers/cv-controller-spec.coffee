'use strict'

describe 'Controller: CvCtrl', () ->


  beforeEach module("whoruApp", ($provide) ->
    $provide.value 'CV_REQUIRED_FIELDS', [
        'name'
        'description'
      ]
    undefined
  )

  beforeEach inject ($controller, $rootScope, $httpBackend, cvService) ->

    @cvService = cvService
    @httpBackend = $httpBackend
    @controller = $controller

    @scope = $rootScope.$new()

    spyOn(@cvService, 'get').andCallThrough()


    @createController = (json) ->

      @httpBackend.expectGET(/data\/cv.json/).respond(json)

      @CvCtrl = @controller 'CvCtrl', {
        $scope: @scope
        cvService: @cvService
      }

      do @httpBackend.flush


  describe 'initialization', ->

    describe 'with correct cv', ->

      cv = undefined

      beforeEach ->
        cv =
          name: 'borja'
          age: 23
          description: 'desc!!!'

        @createController cv

      it 'should call \'cvService.get\' method', () ->
        expect(@cvService.get).toHaveBeenCalled()

      it 'should attach the cv to the scope', () ->
        expect(@scope.cv.name).toBe cv.name
        expect(@scope.cv.age).toBe cv.age
        expect(@scope.cv.description).toBe cv.description


    describe 'with NO correct cv', ->

      beforeEach ->
        cv =
          nameee: 'borja'
          age: 23

        @error = undefined

        try
          @createController cv
        catch e
          @error = e.message

      it 'should throw an exception', () ->

        expect(@error).toMatch('- name')
        expect(@error).toMatch('- description')


