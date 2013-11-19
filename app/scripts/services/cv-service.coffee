'use strict'

# **CvService:**
class CvService

  constructor:($log, $http, CvPart, dataTranslatorService) ->

    #Seed of the name of the cv file
    file = 'cv'

    #Returns a promise with an array of the parts of the cv
    CvService::get = ->

      dataTranslatorService.getDataFilePath(file)
        .then (filePath) ->

          $http.get(filePath)
            .then (response) ->
              cv =
                title : response.data.title
                parts : []

              for part in response.data.parts
                cv.parts.push new CvPart(part)
              cv


angular.module('whoruApp').service 'CvService', ['$log', '$http', 'CvPart', 'DataTranslatorService', CvService]