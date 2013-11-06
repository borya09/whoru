'use strict'

class CvService

  constructor:($log, $http) ->

    urlBase = 'data/cv.json'

    CvService::get = ->
      $http.get(urlBase)
        .then (response) ->
          response.data


angular.module('whoruApp').service 'cvService', ['$log', '$http', CvService]