# -*- encoding : utf-8 -*-
class PostsController < ApplicationController
  
  respond_to :html
  
  def index
    @posts = Post.all    
  end
  
  def show
    @post = Post.find(params[:id])
    respond_with(@post)
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Пост успешно добавлен"
      respond_with(@post, location: posts_path)
    else
      render 'new'
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Пост успешно обновлен"
      respond_with(@post, location: posts_path)
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notuce] = "Пост успешно удален"
    redirect_to posts_path
  end
  
end
