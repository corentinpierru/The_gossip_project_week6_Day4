class CommentController < GossipsController
  before_action :authenticate_user, only: [:create, :new, :destroy, :edit]
  def index 

  end

  def new

  end

  def create
    puts "$" * 60
    puts @gossip
    @comment = Comment.new(content: params['content'], gossip_id: params['gossip_id'])
    if @comment.save
      redirect_to gossips_path
    else 
      render :new
    end
  end
private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in before comments."
      redirect_to new_session_path
    end
  end
end 
