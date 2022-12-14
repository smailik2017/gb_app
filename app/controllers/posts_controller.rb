class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    # @posts = Post.all.order(:id).paginate(page: params[:page], per_page: 7)
    if params[:query] 
      @posts = Post.where("name LIKE ?", "%#{params[:query]}%")
    else
      @posts = Post.all.order(:id).paginate(page: params[:page], per_page: 5)
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    tmp_post_params = post_params
    tmp_post_params["user_id"] = current_user.id
    post_params = tmp_post_params

    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    if params[:order] == "0"
      @found_posts = Post.search_scope(params[:query]).order(:name)
    else
      @found_posts = Post.search_scope(params[:query]).order(:created_at)
    end
    render layout: false
  end

  def autocomplete
    @autocomplete_results = Post.search_scope(params[:q])
    render layout: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :title, :content)
    end
end
