class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to the Alpha Blog #{@user.username}"
            session[:user_id] = @user.id
            redirect_to @user
        else
          render 'new'
        end
        
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def index
       @users = User.all 
    end
    
    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    
    def require_same_user
        if current_user != @article.user and !current_user.admin?
            flash[:danger] = "You can only edit or delete your own articles"
            redirect_to root_path
        end
    end
   
end
