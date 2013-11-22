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

    $rootScope.header.nav.push navInfo
    $scope.id = sectionId

    contactsService.get()
      .then (data) ->
        $scope.contacts = data.contacts
        $scope.title = data.title
        navInfo.title  = data.header
    return
  ]
