# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def new
    @post = Post.new
  end

  def edit; end

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    if @post.save
      render json: @post
    else
      render json: @post.errors
    end
  end

  #TODO 
  # form objectに書き換える
  def create
    if @post.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def update
    if @post.update
      redirect_to '/'
    else
      render 'new'
    end
  
  end

  def destroy
    @post.destroy

    render json: { notice: 'post was successfully removed.' }
  end

  private

  def post_validation_form_params
    params.require(:post_validation_form).permit(:title, :body)
  end

  # def forms
  #   @forms ||= PostValidationForm.new(post_params)
  # end

  def set_post
    @post = Post.find(params[:id])
  end
end
