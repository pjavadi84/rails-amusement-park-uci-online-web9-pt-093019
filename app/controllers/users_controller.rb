class UsersController < ApplicationController
    def index
        @users=User.all
    end

    def new
        @user = User.new
    end

    def create
    
        # @user = User.find_or_create_by(name: params[:user][:name])
        @user = User.create(user_params)
        if @user && @user.authenticate(params[:user][:password])
            redirect_to user_path(@user)
            # binding.pry
        else
            render :new
        end
    end

    def show
        # binding.pry
        @user = User.find(params[:user])
        
    end

    private

    def user_params
        params.require(:user).permit(:name, :happiness, :nausea, :height, :password, :password_confirmation)
    end

end
