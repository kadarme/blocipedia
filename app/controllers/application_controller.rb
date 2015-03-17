class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   include Pundit
   protect_from_forgery with: :exception
  
   before_action :configure_permitted_parameters, if: :devise_controller?
   before_action :setup_stripe
 
   rescue_from Pundit::NotAuthorizedError do |exception|
     redirect_to root_url, alert: exception.message
   end
  
   protected
 
   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << :name
   end
  
  private
  
  def setup_stripe
    if current_user
      @amount = 15_00
      @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership -#{current_user.name}",
      amount: @amount
       }
    else
      @amount = 15_00
      @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership",
      amount: @amount
       }
    end
  end
  
end
