Rappid.controller 'NavbarController', [
  '$scope'
  '$location'
  '$element'
  'dashboards'

  ($scope, $location, $element, dashboards) ->

    # Dashboards for navbar items
    $scope.dashboards = dashboards

    # Uses the url to determine if the selected
    # menu item should have the class active.
    $scope.$location = $location

    $scope.$watch('$location.path()', (path) ->
      $scope.currentPath = path || '/'

      # Collapse navbar in mobile view
      # $element.find('.navbar-collapse.in').collapse 'hide'
      $element.find('.navbar-collapse').removeClass 'in'
    )

    $scope.getClass = (id) ->
      path = "/#{id}"
      active = $scope.currentPath.substring(0, path.length) == path
      return if active then 'active' else ''
]
