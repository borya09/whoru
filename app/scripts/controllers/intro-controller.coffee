'use strict'

angular.module('whoruApp')
  .value 'CV_REQUIRED_FIELDS',
    [
      'name'
      'summary'
    ]

  .controller 'IntroCtrl', ['$scope', '$rootScope', 'IntroService', 'CV_REQUIRED_FIELDS', ($scope, $rootScope, introService, requiredFields) ->

    sectionId = 'intro'

    navInfo =
      order: 1
      title : 'intro'
      href : '#' + sectionId

    introHasErrors = (intro)->
      error = ''
      for field in requiredFields
        error += if intro[field] is undefined then " - #{field}\n" else ''
      error


    $rootScope.nav.push navInfo
    $scope.id = sectionId


    introService.get()
      .then (intro) ->
        if errors = introHasErrors intro
          throw new Error "Required fields:\n #{errors}"
        else

          navInfo.title = intro.fullname()
          $scope.intro = intro

    return

  ]
