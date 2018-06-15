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
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "Mise à jour avec succès"
            redirect_to edit_user_path
        else
            render 'edit'
        end
    end
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end