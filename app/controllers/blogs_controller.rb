class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  # GET /blogs.json
  # /blogs call the index action
  def index
    # Blog.limit(1) will only show the 1st one
    @blogs = Blog.all
    # Call all blogs from the db and make it available to the @blogs var, then the view page can call that
  end

  # GET /blogs/1
  # GET /blogs/1.json
  # On line 2, the before_action calls the :set_blog method, as if the before_action def (defined on private), is inside this show def
  def show
  end

  # GET /blogs/new
  # Show new form
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  # Show edit form
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  # Receive :show data and import to db, on "Create Blog" click.
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      #if its valid redirect, with notice
      if @blog.save 
        format.html { redirect_to @blog, notice: 'Your post is now live.' }
        # same as redirect_to blog_path(@blog), ...
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  # Receive :edit modified data and update the db.
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Your post is now updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  # delete record from db
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Post was removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
