'use strict';

# **QuestionsService:**
class QuestionsService

  constructor: ($log, $http, dataTranslatorService) ->

    #Seed of the name of the cv file
    file = 'questions'

    #Returns a promise with an array of the parts of the cv
    QuestionsService::get = ->

      dataTranslatorService.getDataFilePath(file)
        .then (filePath) ->

            $http.get(filePath)
              .then (response) ->

                response.data

angular.module('whoruApp').service 'QuestionsService', ['$log', '$http', 'DataTranslatorService', QuestionsService]