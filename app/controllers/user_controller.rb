class UserController < ApplicationController
  def show
    @gossip = Gossip.find(params['id'])  
  end

  def create
    puts "$" * 60
    puts params
    puts "$" * 60
    
    @user = User.new(first_name: params['first_name'], last_name: params['last_name'], email: params['email'], password: params['password'], city: City.find(rand(City.first.id..City.last.id)))
    @user.save
    if @user.save
      redirect_to new_session_path
    else
      render :new
    end
  end
end
