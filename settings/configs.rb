class Configs < Settingslogic
  source "./settings/#{ARGV.first}.yml"
  namespace "configs"
  reload!
end