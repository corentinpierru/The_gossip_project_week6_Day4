class SessionsController < ApplicationController
  def show   
  end

  def create
    id = session[:user_id]
    puts "$" * 60
    puts params
    puts "$" * 60
    puts params['email']
    user = User.find_by(email: params['email'])
    
    if user && user.authenticate(params['password'])
      session[:user_id] = user.id
      flash[:success] = "tu es bien login"
      redirect_to gossips_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to gossips_path
  end
end
