class BillboardController < ApplicationController
  before_action :require_login #, only: [:create, :edit, :destroy, :comment]
  
  def index
   
  end
  
  
  def create
    post = Post.new(title: params[:title], content: params[:content], user_name: params[:user_name])
    post.save
    
    redirect_to '/billboard/index'
  end
  
  
  def edit
    @post = Post.find(params[:post_id])
  end
  
  
  def editing
    post = Post.find(params[:post_id])
    post.title = params[:title]
    post.content = params[:content]
    post.save
    
    redirect_to '/billboard/index'
  end
  
  
  def comment
    comment = Comment.new(user_name: params[:user_name], content: params[:content], post_id: params[:post_id])
    comment.save
    
    redirect_to '/billboard/index'
  end

end
