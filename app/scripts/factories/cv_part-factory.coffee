'use strict'


class CvPart
  constructor: (part) ->
    @title = part.title
    @description = part.description
    @content = part.content
    @cssClass = part.key


angular.module('whoruApp').factory "CvPart", -> CvPart

