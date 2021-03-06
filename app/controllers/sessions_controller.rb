class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user, success: "Vous êtes connecté ! Bienvenue sur le site qui vous donnera la réponse à la question de l'univers..."     
    else 

    	flash.now[:danger] = 'Invalid email/password combination'
    	render 'new'
    end
  end


  def destroy
    log_out if logged_in?
    flash[:success] = 'Vous êtes bien déconnecté'
    redirect_to root_url
  end


end
