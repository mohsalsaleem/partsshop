class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check
	def check
		if user_signed_in? and params[:controller] == 'devise/sessions' and params[:action] == 'new'
			redirect_to root_path, notice: "You are already signed in. Please sign out to sign in as another user."
		elsif user_signed_in? and params[:controller] == 'devise/registrations' and params[:action] == 'new'
			redirect_to root_path, notice: "You are already signed in. Please sign out to sign up."
		end
			
		puts "Controller Name: #{params[:controller]}"+"\tAction Name: #{params[:action]}"
	end

end
