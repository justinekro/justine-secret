class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def index
  end

  def edit
  	@user = User.find(params[:id])

# On interdit à un user de modifier le profil d'un autre user    
    if @user == current_user
      render 'edit'
    else 
      flash.now[:error] = "Petit filou, vous essayez de modifier un profil qui n'est pas le vôtre !"
      render 'show'
    end
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      flash[:success] = "Votre profil a bien été créé ! Bienvenue sur le site qui vous donnera la réponse à la question de l'univers..."

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
