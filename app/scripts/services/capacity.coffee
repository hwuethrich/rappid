Rappid.service 'capacityService', [
  '$http'
  '$interval'

  class CapacityService

    url: '/data/capacity.json'

    constructor: ($http, $interval)->
      @http = $http

    fetch: (callback)->
      @http.get(@url).then (resp)->
        callback resp.data.records
]
