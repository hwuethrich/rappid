Rappid.directive 'panel', ->
  restrict: 'E'
  transclude: true
  replace: true
  templateUrl: 'partials/directives/panel.html'
  scope:
    heading: '@'
    icon: '@'
    onConfigClick: '&'

  link: (scope, element, attrs)->

    body  = element.find('.panel-body')
    table = body.children('table, .table-responsive, .list-group')
    body.replaceWith table if table.length > 0

    scope.hasConfig = attrs.onConfigClick?
