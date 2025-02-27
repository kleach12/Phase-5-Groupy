class Api::UsersController < ApplicationController
  wrap_parameters format: []

  def index
    render json: User.all
  end
  def create 
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      render json: user, status: :created
    else 
      render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show 
    user = user_in_session
    if user
      render json: user
    else
      render json: {error: "No User Signed In"}, status: :ok
    end
  end

  def update
    user = user_in_session
    if user
      user.update(user_updated_params)
      if user.valid?
      render json: user
      else
        render json: {errors: user.errors.full_messages}
      end
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  def destroy
    user = user_in_session
    if user
      user.destroy
      head :no_content
    else
      render json: {error: "This User is not logged in"}
    end
  end

  def viewing_user
    user = User.find_by(username: user_params[:username])
    if user
      render json: user
    else 
      render json: {error: 'This user does not exsist'}
    end
  end


  private 

  
  def user_params
    params.permit(:username, :first_name, :last_name, :password, :password_confirmation, :dob, :email, :city, :bio, :facebook, :insta, :tiktok, :twitter, :image, :theme)
  end

  def user_updated_params
    params.permit(:bio, :facebook, :insta, :tiktok, :twitter, :image, :theme, :city)
  end

  def user_in_session
    User.find(session[:user_id]) 
  end

end


# use attached and new params for update only