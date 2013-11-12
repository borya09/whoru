'use strict'

class CvService

  constructor:($log, $http, CvSection) ->

    urlBase = 'data/cv.json'

    CvService::get = ->
      $http.get(urlBase)
        .then (response) ->
          cv = []
          for section in response.data.sections
            cv.push new CvSection(section)
          cv


angular.module('whoruApp').service 'CvService', ['$log', '$http', 'CvSection', CvService]