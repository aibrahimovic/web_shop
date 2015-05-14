class PageContainer

  $home_url= 'https://webshop-abhshoes.herokuapp.com//'
  
  def initialize(browser)
    @browser = browser
  end

  def get_browser
  	return @browser
  end

  def goto_home
    @browser.goto $home_url
  end

  def select_element(element)
    element.flash
    return element
  end

  def get_build_version()
      Watir::Wait.until { @browser.div(:id,"footer_wrapper").div(:id, "footer").span(:id, "footer_version").exists? }
      a= @browser.div(:id,"footer_wrapper").div(:id, "footer").span(:id, "footer_version").text()      
      return a.match(/(\w\d+\s\d+.\d+)$/)[0]
  end

  def set_variable_cb(value)
      self.class.class_variable_set(:@@cb, value)
  end

  def get_variable_cb()
      return self.class.class_variable_get(:@@cb)
  end

end
