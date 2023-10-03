class UsersController < ApplicationController
    def show
        @user = User.find_by(id: params[:id])

        render :show
    end
    
    def new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login(@user)
            redirect_to users_url
        else
            flash.now[:errors] = @user.error.messages_full
            render :new, status: 422
        end
    end

    private
    def user_params
        params.require(:users).permit(:email, :password)
    end
end
