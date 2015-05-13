def open_browser()

	#if RUBY_PLATFORM=~ /x86_64-linux/
		$browser=Watir::Browser.new :chrome
		$browser.driver.manage.window.maximize
		$browser.goto 'https://webshop-abhshoes.herokuapp.com//'
	#end
end

def close_browser()

	if RUBY_PLATFORM=~ /x86_64-linux/
		$browser.close
	end
end

