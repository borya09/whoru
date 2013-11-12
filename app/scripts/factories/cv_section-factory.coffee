'use strict'


class CvSection
  constructor: (section) ->
    @title = section.title
    @content = section.content
    @cssClass = section.key
  getType: ->
    switch typeof @content
      when 'string' then 'description'
      when 'object' then 'list'


#TODO: unit test!!!

angular.module('whoruApp').factory "CvSection", -> CvSection

