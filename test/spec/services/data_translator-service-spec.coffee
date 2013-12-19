'use strict'

class DataTranslatorServiceSpec extends ServiceSpec

  test: ->

    fixtures = @fixtures

    beforeEach inject (DataTranslatorService) ->
      @dataTranslatorService = DataTranslatorService


    describe 'initialization', ->

      it 'should GET \'config.json\' file', ->
        @httpBackend.expectGET(/data\/config.json$/).respond fixtures.config.d
        do @httpBackend.flush


    describe '\'getAvailablesLocales\' method', ->

      describe 'with two locales configured', ->

        fixture = undefined

        beforeEach ->
          fixture = fixtures.config.d
          @httpBackend.when('GET', /data\/config.json$/).respond fixture
          do @httpBackend.flush

        it 'should return a promise with an array of two locales', ->
          @dataTranslatorService.getAvailablesLocales()
            .then (locales) ->
              expect(locales.length).toBe 2
              expect(locales[0].key).toBe fixture.config.locales[0].key
              expect(locales[1].key).toBe fixture.config.locales[1].key


      describe 'with NO locales configured', ->

        fixture = undefined

        beforeEach ->
          fixture = fixtures.config.e
          @httpBackend.when('GET', /data\/config.json$/).respond fixture
          do @httpBackend.flush

        it 'should return a promise with NO locale', ->
          @dataTranslatorService.getAvailablesLocales()
            .then (locales) ->
              expect(locales.length).toBe 0



    describe '\'setLocale|getLocale\' method', ->

      describe 'with two locales configured', ->

        localeES = fixtures.config.d.config.locales[0]
        localeEN = fixtures.config.d.config.locales[1]

        beforeEach ->
          @httpBackend.when('GET', /data\/config.json$/).respond fixtures.config.d
          do @httpBackend.flush

        it 'should change current locale from \'EN\' to \'ES\' and to \'EN\' again', ->
          expect(@dataTranslatorService.getLocale().key).toBe 'en'
          @dataTranslatorService.setLocale localeES
          expect(@dataTranslatorService.getLocale().key).toBe 'es'
          @dataTranslatorService.setLocale localeEN
          expect(@dataTranslatorService.getLocale().key).toBe 'en'



    describe '\'getDataFilePath\' method', ->

      describe 'with EN as current language, and \'cv\' file path is requested', ->

        beforeEach ->
          @httpBackend.when('GET', /data\/config.json$/).respond fixtures.config.d
          do @httpBackend.flush

        it 'should return ', ->
          @dataTranslatorService.getDataFilePath('cv')
            .then (path) ->
              expect(path).toBe 'data/cv_en.json'


    afterEach ->
      do @httpBackend.verifyNoOutstandingExpectation
      do @httpBackend.verifyNoOutstandingRequest

describe 'Service: DataTranslatorService', () -> do new DataTranslatorServiceSpec().test