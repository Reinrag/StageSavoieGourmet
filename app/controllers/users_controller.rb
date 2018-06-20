class UsersController < ApplicationController
    
    before_action :set_user, only: [:edit, :update, :show]
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            UserMailer.confirm(@user).deliver_now
            flash[:success] = "Votre compte à bien été créé, vous devriez recevoir un mail de confirmation"
            redirect_to signup_path
        else
           render 'new' 
        end
    end
    
    def edit
    end
    
    def update
        if @user.update(user_params)
            flash[:success] = "Mise à jour avec succès"
            redirect_to edit_user_path
        else
            render 'edit'
        end
    end
    
    def show
        
    end
    
    def index
        @users = User.paginate(:page => params[:page], :per_page => 5)
    end
    
    def confirm
        @user = User.find(params[:id])
        if @user.confirmation_token == params[:token]
            @user.update_attributes(confirmed: true, confirmation_token: nil)
            @user.save(validate: false)
            session[:auth] = @user.to_session
            flash[:success] = "Votre compte a bien été confirmé"
            redirect_to user_path(user)
        else
            flash[:danger] = "Ce token ne semble pas valide"
            redirect_to signup_path
        end
    end
    
    private 
        def set_user
            @user = User.find(params[:id]) 
        end
        
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end
end