class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
     if @user.save
      flash[:success]= "Welcome to the Sample App"
      redirect_to user_url(@user) #also could just use @user and Rails would know to use the url
     else
       render 'new'
     end
   end

   private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation)
    end
end
