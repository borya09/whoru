'use strict'

# **ContactsService:**
class ContactsService

  constructor:($log, $http) ->

    urlBase = 'data/contacts.json'

    ContactsService::get = ->
      $http.get(urlBase)
        .then (response) ->
          response.data
        , ->
          console.error "create \'#{urlBase}\' file !!!"

angular.module('whoruApp').service 'ContactsService', ['$log', '$http', ContactsService]