class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Nouveau utilisateur #{@user.username} enregistrée"
            redirect_to signup_path
        else
           render 'new' 
        end
    end
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end