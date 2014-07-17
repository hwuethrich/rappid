Rappid.controller 'HomeDashboardController', [
  '$scope'
  '$interval'
  'capacityService'

  ($scope, $interval, capacityService) ->
    $scope.records = []

    $scope.columns = [
      'SOF',
      'Bezeichnung',
      'Up Mbit'
      'Down Mbit'
    ]

    capacityService.fetch (records)->
      $scope.records = records[0..9]

    updateGauges = ->
      $scope.gaugeVal1 = Math.random() * 100
      $scope.gaugeVal2 = Math.random() * 100
      $scope.gaugeVal3 = Math.random() * 100
      $scope.gaugeVal4 = Math.random() * 100

    updateGauges()
    poller = $interval updateGauges, 10000

    $scope.$on "$destroy", ->
      $interval.cancel poller

    $scope.hello = ->
      console.log 'hello', arguments
]
