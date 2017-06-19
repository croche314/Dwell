class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
  	if session[:user_type] == "landlord"
  		Landlord.find(session[:user_id]) unless session[:user_id].nil?
  	elsif session[:user_type] == "tenant"
  		Tenant.find(session[:user_id]) unless session[:user_id].nil?
  	end
  end
  
  helper_method :current_user
end
