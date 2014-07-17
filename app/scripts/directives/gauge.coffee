Rappid.directive 'gauge', ->
  restrict: 'EA'

  scope:
    min: '='
    max: '='
    title: '@'
    value: '@'

  template: '<div class="wrapper"></div>'

  link: (scope, element)->
    config = {}

    try
      gauge = new JustGage
        parentNode: element.find('.wrapper')[0]
        title: scope.title
        min: scope.min || 0
        max: scope.max || 100
        label: 'Mbit/s'
        gaugeWidthScale: 1
        donut: false
        hideInnerShadow: true
        value: scope.value
        relativeGaugeSize: false
    catch error
      # nop

    unwatch = scope.$watch 'value', (updatedValue)->
      gauge.refresh updatedValue if updatedValue && gauge

    scope.$on '$destroy', unwatch
