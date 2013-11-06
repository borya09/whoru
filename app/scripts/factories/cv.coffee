'use strict'


class Cv
  constructor: (cv) ->
    for key of cv
      @[key] = cv[key]

  fullname: ->
    fullname = @name
    fullname += " #{@surname1}" if @surname1
    fullname += " #{@surname2}" if @surname2
    fullname

#TODO: unit test!!!

angular.module('whoruApp').factory "Cv", -> Cv

