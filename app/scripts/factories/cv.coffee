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

class Cv
  constructor: (cv) ->
    for key of cv
      value = cv[key]
      if key == 'sections'
        @sections = []
        for section in value
          @sections.push new CvSection section
      else
        @[key] = value

  fullname: ->
    fullname = @name
    fullname += " #{@surname1}" if @surname1
    fullname += " #{@surname2}" if @surname2
    fullname

#TODO: unit test!!!

angular.module('whoruApp').factory "Cv", -> Cv

