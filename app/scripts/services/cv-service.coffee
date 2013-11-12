'use strict'

class CvService

  constructor:($log, $http, CvPart) ->

    urlBase = 'data/cv.json'

    CvService::get = ->
      $http.get(urlBase)
        .then (response) ->
          cv = []
          for part in response.data.parts
            cv.push new CvPart(part)
          cv


angular.module('whoruApp').service 'CvService', ['$log', '$http', 'CvPart', CvService]