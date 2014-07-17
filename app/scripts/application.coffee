'use strict'

Rappid = angular.module 'rappid', [
  'ngCookies'
  'ngResource'
  'ngRoute'
  'leaflet-directive'
  'ngJustGage'
]

# List of dashboards
Rappid.constant 'dashboards', [
  { id: 'home', icon: 'home',      name: 'Home', controller: 'HomeDashboardController' }
  { id: 'kpi',  icon: 'dashboard', name: 'KPI'  }
  { id: 'lan',  icon: 'cog',       name: 'LAN'  }
  { id: 'maps', icon: 'globe',     name: 'Maps' }
]

Rappid.config([
  '$routeProvider'
  '$locationProvider'
  'dashboards'

  ($routeProvider, $locationProvider, dashboards, config) ->

    # Dashboard routes
    for dashboard in dashboards
      id = dashboard.id
      $routeProvider.when "/#{id}",
        templateUrl: "/partials/dashboards/#{id}.html"
        controller: dashboard.controller

    # Show first dashboard by default
    default_path = '/' + dashboards[0].id
    $routeProvider.otherwise redirectTo: default_path

    # Without server side support html5 must be disabled.
    $locationProvider.html5Mode true
])

Rappid.run([
  '$location'
  'dashboards'

  ($location, dashboards) ->

    # Open first dashboard when opening root path
    #if $location.path() == '/'
    #  default_path = '/' + dashboards[0].id
    #  $location.path default_path
])
