class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, only: [:admin, :new, :create, :edit, :update, :destroy]

  def index
    @posts = klass.all
    @sponsors = Sponsor.all
  end

  def show
  end

  def new
    @post = klass.new
  end

  def create
    @post = klass.new(post_params)

    if @post.save
      # TODO: redirect to index
      redirect_to @post, notice: "The post was created!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Update successful"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "Post destroyed"
  end

  private

    def post_params
      params.require(key).permit(:title, :content, :image, :type, :description, :url, :button_text)
    end

    def find_post
      @post = klass.find(params[:id])
    end

end
