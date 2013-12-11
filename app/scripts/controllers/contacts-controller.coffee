'use strict'

angular.module('whoruApp')

  .controller 'ContactsCtrl', ['$scope','$rootScope', 'ContactsService',  ($scope, $rootScope, contactsService) ->

    #publish in the $rootScope, info for the header navbar
    sectionId = 'contacts'

    navInfo =
      id : sectionId
      order: 50
      title : 'contacts'
      href : '#' + sectionId
      hidden : false

    $rootScope.header.nav.options.push navInfo
    $scope.id = sectionId

    contactsService.get()
      .then (data) ->
        if data
          $scope.contacts = data.contacts
          navInfo.title  = data.header
    return
  ]
