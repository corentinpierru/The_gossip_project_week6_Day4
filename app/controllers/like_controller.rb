class LikeController < GossipsController
  before_action :authenticate_user, only: [:create, :new, :destroy]

  def index 

  end

  def new

  end

  def create
    @like = Like.new(gossip_id: params['gossip_id'], comment_id: params['comment_id'].to_i)
    if @like.save
      render.new
    else
      flash[:danger] = "le like n'a pas fonctionné"
      render :new
    end
  end

private
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in before like."
      redirect_to new_session_path
    end
  end

end
