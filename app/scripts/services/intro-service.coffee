'use strict'

# **IntroService:**
class IntroService

  constructor:($log, $http, Intro, dataTranslatorService) ->

    #Seed of the name of the cv file
    file = 'intro'

    #Returns a promise with the Intro
    IntroService::get = ->

      dataTranslatorService.getDataFilePath(file)
        .then (filePath) ->

            $http.get(filePath)
              .then (response) ->

                new Intro response.data.intro, response.data.header, response.data.title

              , ->
                console.error "create \'#{filePath}\' file !!!"
        , ->
          console.error "without config, intro can not be loaded"


angular.module('whoruApp').service 'IntroService', ['$log', '$http', 'Intro', 'DataTranslatorService', IntroService]