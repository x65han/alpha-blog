class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @users = User.paginate(page: params[:page], per_page: 5).order("created_at DESC")
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Welcome to Alpha Blog #{@user.username}"
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def edit
        
    end

    def update
        if @user.update(user_params)   
            flash[:success] = "Your information was successfully updated"
            redirect_to articles_path
        else 
            render 'edit'
        end
    end

    def show
        @articles = @user.articles.paginate(page: params[:page], per_page: 5).order("created_at DESC")
    end

    private 
    def set_user
        @user = User.find(params[:id]) 
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def require_same_user
        if current_user != @user and !current_user.admin?
            flash[:danger] = "You can only edit or delete you own profile"
            redirect_to home_path
        end
    end
end
