'use strict'

class Intro
  constructor: (intro) ->
    for key of intro
      @[key] = intro[key]

  fullname: ->
    fullname = @name
    fullname += " #{@surname1}" if @surname1
    fullname += " #{@surname2}" if @surname2
    fullname

#TODO: unit test!!!
angular.module('whoruApp').factory "Intro", -> Intro

