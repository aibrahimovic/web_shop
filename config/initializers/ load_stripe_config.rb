APP_CONFIG = {} unless defined? APP_CONFIG
APP_CONFIG.merge!(YAML.load_file("#{Rails.root}/config/stripe-conf.yml")