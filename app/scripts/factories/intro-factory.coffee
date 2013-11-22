'use strict'

class Intro
  constructor: (data, title, header) ->
    @title = title
    @header = header
    for key of data
      @[key] = data[key]

  Intro::fullname= ->
    fullname = @name
    fullname += " #{@surname1}" if @surname1
    fullname += " #{@surname2}" if @surname2
    fullname


angular.module('whoruApp').factory "Intro", -> Intro

