class LanguagesController < ApplicationController

	def my_language
    	
		language = params[:language]
    	session[:language] = params[:language]
    	redirect_to home_path
	end

	def change_locale
	    l = params[:locale].to_s.strip.to_sym
	    l = I18n.default_locale unless I18n.available_locales.include?(l)
	    cookies.permanent[:educator_locale] = l
	    redirect_to request.referer || root_url
	  end
end
