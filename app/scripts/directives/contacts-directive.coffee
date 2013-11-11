'use strict'

angular.module('whoruApp')
  .directive('whContacts', ->
    {
      restrict: 'E',
      replace:true,
      scope:{
        contacts:'='
      }
      template: '''
        <ul class="wh-contacts" ng-if="contacts.length">
          <li ng-repeat="contact in contacts">
            <a ng-href="{{contact.type=='phone'?'tel:':contact.type=='mail'?'mailto:':''}}{{contact.value}}" title="{{contact.value}}" data-wh-icon="{{contact.icon}}" ng-class="contact.type" class="wh-contact">
              {{contact.value}}
            </a>
          </li>
        </ul>
      '''
    }
  )