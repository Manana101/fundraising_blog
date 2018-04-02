class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, only: [:admin, :new, :create, :edit, :update, :destroy]

  def index
    @posts = klass.all
    # if params[:category].blank?
    #   # add redirect to root path, we never want to show all posts
    #   @posts = klass.where(category_id: 1).order("created_at DESC")
    # else
    #   @category_id = Category.find_by(name: params[:category]).id
    #   @posts = Post.where(category_id: @category_id).order("created_at DESC")
    # end
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

  # def admin
  #   redirect_to root_path if authenticate
  # end
  #
  # def logout
  #   session[:admin] = false
  #   redirect_back(fallback_location: root_path)
  # end

  private

    def post_params
      params.require(key).permit(:title, :content, :category_id, :image, :type, :description, :url, :button_text)
    end

    def find_post
      @post = klass.find(params[:id])
    end

# protected
#
#   def authenticate
#     authenticate_or_request_with_http_basic do |username, password|
#       admin_username = Rails.application.secrets.admin_username
#       admin_password = Rails.application.secrets.admin_password
#       session[:admin] = true if (username == admin_username && password == admin_password)
#     end
#   end

end
