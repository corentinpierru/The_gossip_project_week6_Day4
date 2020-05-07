class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:create, :new, :destroy, :edit]
  before_action :check_current_and_gossip_author, only: [:edit, :update, :destroy]
  def index 

  end

  def new

  end

  def create
    puts "$" * 60
    puts params
    puts "$" * 60
    
    @gossip = Gossip.new(title: params['title'], content: params['content'], user: User.find(rand(User.first.id..User.last.id)))
    @gossip.save
    if @gossip.save == true 
      redirect_to "/gossips/new"
    else
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params['id'])
    if @gossip.update(title: params['title'], content: params['content'])
      redirect_to @gossip
    else
      render :edit
    end
  end

  def show
    puts  "test des params"
    puts current_user
    
    puts "$" * 60
    @chiffre_page = params['id']
    @gossip = Gossip.find(params['id'])
    puts "$" * 60
    puts @gossip.user
  end

  def destroy
    @gossip = Gossip.find(params['id'])
    @gossip.destroy
    redirect_to gossips_path
  end

private
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def check_current_and_gossip_author
    unless current_user == @gossip.user
      flash[:danger] = "You are not the author of the gossip"
      redirect_to gossips_path
    end
  end 
end
