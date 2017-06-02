class LoginController < ApplicationController
	layout 'home'

	def index
		render 'home'
		session[:user_id] = nil
		session[:user_type] = nil
	end

	def create
		if params[:user_type] == 'landlord'
			landlord = Landlord.new(
				first_name:params[:first_name],
				last_name:params[:last_name], 
				email: params[:email],
				password: params[:password]
				)
			landlord.save
			if !landlord.errors.empty?
				flash[:warning] = landlord.errors.full_messages
				redirect_to login_path and return
			else
				flash[:success] = ["New Profile Created! Welcome!"]
				session[:user_id] = landlord.id
				session[:user_type] = 'landlord'
				redirect_to properties_path and return
			end
		end

		if params[:user_type] == 'renter'
			tenant = Tenant.new(
				first_name:params[:first_name],
				last_name:params[:last_name], 
				email: params[:email],
				password: params[:password]
				)
			tenant.save
			if !tenant.errors.empty?
				flash[:warning] = tenant.errors.full_messages
				redirect_to login_path and return
			else
				flash[:success] = ["New Profile Created! Welcome!"]
				session[:user_id] = tenant.id
				session[:user_type] = 'tenant'
				redirect_to "/tenants/"+tenant.id.to_s
			end
		else
			flash[:info] = ["Please select a valid user type"]
			redirect_to login_path
		end
	end

	def sign_in
		session[:user_id] = nil
		session[:user_type] = nil
	end

	def authenticate
		if params[:user_type] == 'landlord'
			landlord = Landlord.find_by_email(params[:email])
			if !landlord.nil?
				session[:user_id] = landlord.id
				session[:user_type] = 'landlord'
				flash[:success] = ["Welcome Back #{landlord.first_name}!"]
				redirect_to "/landlords/dashboard"
			else
				flash[:warning] = ["Invalid credentials"]
				redirect_to "/login/sign_in"
			end
		end

		if params[:user_type] == 'renter'
			tenant = Tenant.find_by_email(params[:email])
			if !tenant.nil?
				session[:user_id] = tenant.id
				session[:user_type] = "tenant"
				puts session[:user_type]
				flash[:success] = ["Welcome Back #{current_user.first_name}!"]
				redirect_to "/tenant_dashboard/#{tenant.id}"
			else
				flash[:warning] = ["Invalid credentials"]
				redirect_to "/login/sign_in"
			end
		end
	end

	def logout
		redirect_to login_path
	end

end
