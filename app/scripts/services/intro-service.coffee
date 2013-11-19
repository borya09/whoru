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

                new Intro(response.data.intro, response.data.title)



angular.module('whoruApp').service 'IntroService', ['$log', '$http', 'Intro', 'DataTranslatorService', IntroService]