exports.config =
  # See docs at http://brunch.readthedocs.org/en/latest/config.html.

  # Not required for angular
  modules:
    definition: false
    wrapper: false

  sourceMaps: false

  files:
    javascripts:
      defaultExtension: 'coffee'
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^(vendor|bower_components)/
      order:
        before: [
          'bower_components/jquery/dist/jquery.js'
        ]
        after: [
          'vendor/scripts/console-helper.js'
        ]

    stylesheets:
      defaultExtension: 'less'
      joinTo:
        'stylesheets/app.css' : /^app/
        'stylesheets/vendor.css' : /^(vendor|bower_components)/

    templates:
      defaultExtension: 'hbs'
      joinTo: 'javascripts/app.js'

  plugins:
    coffeelint:
      pattern: /^app\/.*\.coffee$/
      options:
        max_line_length:
          level: "ignore"
        indentation:
          value: 2
          level: "error"
