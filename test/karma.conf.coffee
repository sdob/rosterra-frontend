# Karma configuration
# http://karma-runner.github.io/0.12/config/configuration-file.html
# Generated on 2015-01-15 using
# generator-karma 0.8.3

module.exports = (config) ->
  config.set
    # base path, that will be used to resolve files and exclude
    basePath: '../'

    # testing framework to use (jasmine/mocha/qunit/...)
    frameworks: ['jasmine']

    # list of files / patterns to load in the browser
    files: [
      # imports
      'bower_components/angular/angular.js'
      'bower_components/angular-mocks/angular-mocks.js'
      'bower_components/angular-animate/angular-animate.js'
      'bower_components/angular-aria/angular-aria.js'
      'bower_components/angular-cookies/angular-cookies.js'
      'bower_components/angular-messages/angular-messages.js'
      'bower_components/angular-resource/angular-resource.js'
      'bower_components/angular-route/angular-route.js'
      'bower_components/angular-sanitize/angular-sanitize.js'
      'bower_components/angular-touch/angular-touch.js'
      'bower_components/angular-local-storage/dist/angular-local-storage.js'
      # Manual imports
      'bower_components/jquery/dist/jquery.js'
      'bower_components/angular-css/angular-css.js'
      'bower_components/angular-bootstrap/ui-bootstrap-tpls.js'
      'bower_components/angular-ui-calendar/src/calendar.js'
      'bower_components/moment/moment.js'
      'bower_components/jquery-ui/ui/jquery-ui.js'
      'bower_components/fullcalendar/fullcalendar.js'
      'bower_components/angular-google-chart/ng-google-chart.js'
      'bower_components/spin.js/spin.js'
      'bower_components/angular-spinner/angular-spinner.js'
      # Test code
      'app/scripts/**/*.js'
      'test/mock/**/*.coffee'
      'test/spec/**/*.coffee'
    ],

    # list of files / patterns to exclude
    exclude: []

    # web server port
    port: 8080

    # level of logging
    # possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
    logLevel: config.LOG_INFO

    # Start these browsers, currently available:
    # - Chrome
    # - ChromeCanary
    # - Firefox
    # - Opera
    # - Safari (only Mac)
    # - PhantomJS
    # - IE (only Windows)
    browsers: [
      'PhantomJS'
    ]

    # Which plugins to enable
    plugins: [
      'karma-phantomjs-launcher'
      'karma-jasmine'
      'karma-coffee-preprocessor'
      'karma-coverage'
    ]

    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: true

    # Continuous Integration mode
    # if true, it capture browsers, run tests and exit
    singleRun: false

    colors: true

    reporters: ['progress', 'coverage']

    preprocessors:
      'app/**/*.coffee': ['coffee', 'coverage']
      'test/**/*.coffee': ['coffee']

    coverageReporter:
      type: 'lcovonly'
      subdir: '.'

    # Uncomment the following lines if you are using grunt's server to run the tests
    # proxies: '/': 'http://localhost:9000/'
    # URL root prevent conflicts with the site root
    # urlRoot: '_karma_'
