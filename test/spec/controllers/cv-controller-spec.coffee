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

      @httpBackend.expectGET('/data/cv.json').respond(json)

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
        expect(@scope.cv).toBe cv


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


  ###describe 'contacts', ->

    describe 'with one mail, one phone and two webs', ->

      cv = undefined

      beforeEach ->
        cv =
          name: 'borja'
          age: 23
          description: 'desc!!!'
          contacts: [
            type: "web"
            value: "http://www.as.com"
            icon: "3"
          ,
            type: "phone"
            value: "666999666"
            icon: "2"
          ,
            type: "mail"
            value: "borya09@gmail.com"
            icon: "1"
          ]


        @createController cv

      it 'should call \'cvService.get\' method', () ->
        expect(@scope.cv).toHaveBeenCalled()

  ###