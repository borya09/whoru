'use strict'

angular.module('whoruApp')

  .controller 'ContactsCtrl', ['$scope', 'ContactsService',  ($scope, contactsService) ->
    contactsService.get()
      .then (contacts) ->
          $scope.contacts = contacts
    return
  ]
