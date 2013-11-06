'use strict'

class CvService

  constructor:($log, $http, Cv) ->

    urlBase = 'data/cv.json'

    CvService::get = ->
      $http.get(urlBase)
        .then (response) ->
          new Cv(response.data)


angular.module('whoruApp').service 'cvService', ['$log', '$http', 'Cv', CvService]