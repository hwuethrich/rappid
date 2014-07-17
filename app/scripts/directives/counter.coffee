Rappid.directive 'counter', ->
  restrict: 'EA'
  replace: true

  scope:
    label: '@'
    value: '@'
    type: '@'
    icon: '@'
    iconClass: '@'

  templateUrl: 'partials/directives/counter.html'
