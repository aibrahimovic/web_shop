require 'yaml'

class RSpecConfig

  def self.reload(file_name = './config/configuration.yml')
    @@config_cache = YAML::load(File.read(file_name))
  end
  
  def self.get(sector, name)
    return @@config_cache['rspec'][sector.to_s][name.to_s]
  end
end