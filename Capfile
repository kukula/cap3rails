CAP3_ROOT = File.expand_path("../", __FILE__)

# RM deprecation warning
I18n.config.enforce_available_locales = true
SSHKit::Backend::Netssh.pool.idle_timeout = 60

# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Additional
# https://github.com/capistrano/rvm
# https://github.com/capistrano/bundler
# https://github.com/capistrano/rails
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails'

# Configsuration
require 'settingslogic'
require "#{CAP3_ROOT}/settings/configs"

# Common imports
Dir.glob('helpers/*.rb').each { |r| import r }
Dir.glob('tasks/*.cap').each  { |r| import r }

# Import WebServer tasks
Dir.glob('tasks/unicorn/*.cap').each { |r| import r }
Dir.glob('tasks/nginx/*.cap').each   { |r| import r }