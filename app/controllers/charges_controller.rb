class ChargesController < ApplicationController
  
 before_filter :authenticate_user!
  
 def new
   @amount = 15_00
   @stripe_btn_data = {
    key: "#{ Rails.configuration.stripe[:publishable_key] }",
    description: "Premium Membership - #{current_user.name}",
    amount: @amount
   }
 end
  
 def create
  @amount = 15_00
  # Creates a Stripe Customer object, for associating
  # with the charge
  customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
  )
 
  # Where the real magic happens   
  charge = Stripe::Charge.create(
    customer: customer.id, # Note -- this is NOT the user_id in your app
    amount: @amount,
    description: "Premium Membership - #{current_user.email}",
    currency: 'usd'
  )
   
  current_user.update_attribute(:premium, true)
   
  flash[:success] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
  redirect_to wikis_path # or wherever
 
 # Stripe will send back CardErrors, with friendly messages
 # when something goes wrong.
 # This `rescue block` catches and displays those errors.
 rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_charge_path
 end
end
