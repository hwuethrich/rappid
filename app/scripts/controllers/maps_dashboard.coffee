Rappid.controller 'MapsDashboardController', [
  '$scope'
  '$location'

  ($scope, $location) ->
    $scope.center = { lat: 40.095, lng: -3.823, zoom: 4 }

    $scope.$on "centerUrlHash", (event, centerHash)->
      $location.search c: centerHash
]
