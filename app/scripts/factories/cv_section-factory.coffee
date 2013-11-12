'use strict'


class CvSection
  constructor: (section) ->
    @title = section.title
    @description = section.description
    @content = section.content
    @cssClass = section.key


angular.module('whoruApp').factory "CvSection", -> CvSection

