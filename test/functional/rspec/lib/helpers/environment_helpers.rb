class EnvironmentHelpers
	def self.set_browser
			browser = Watir::Browser.new(RSpecConfig.get(:target, :browser))
			browser.goto RSpecConfig.get(:shop, :full_host)

		return browser
	end
end