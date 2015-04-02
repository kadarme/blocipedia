class UsersController < ApplicationController
   before_action :authenticate_user!
 
   def index
   end
   
  def show
     @user = User.find(params[:id])
  end
  
  def update
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       redirect_to edit_user_registration_path
     else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_registration_path
     end
   end
  
  def downgrade
    @user = current_user
    @wikis = @user.wikis
    if current_user.update(role: 'standard')
      flash[:notice] = "Account downgraded."
    else  
      flash[:error] = "There was an error downgrading the account. Please try again."
    end
    redirect_to edit_user_registration_path
  end
  
   private
 
   def user_params
     params.require(:user).permit(:name)
   end
end