class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def index
  end

  def edit
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save

 # On login quand un nouvel user est créé     
      log_in @user
  		redirect_to @user
  	else render 'new'
  	end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to @user
  	else render 'edit'
  	end
  end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end

	def show
		@user = User.find(params[:id])
	end

	private
  	def user_params
      params.permit(:name, :email, :password)
  	end

end
