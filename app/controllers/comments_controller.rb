class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.paginate(page: params[:page], per_page: 5)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    if user_signed_in?
      @comment = Comment.new
    else
      redirect_to root_path, alert: 'Please sign in to create a comment'
    end

  end

  # GET /comments/1/edit
  def edit
    @post = Post.find(@comment.post_id)
    if not user_signed_in?
      redirect_to root_path, alert: 'Please sign in edit a comment.'
    elsif current_user.id != @comment.user_id
      redirect_to root_path, alert: 'Comment can only be updated by the creator.'
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    if user_signed_in?
      @comment = Comment.new(comment_params)
      @comment.user_id = current_user.id
      @post = Post.find(@comment.post_id)

      respond_to do |format|
        if @comment.save
          @post = Post.find(@comment.post_id)
          format.html { redirect_to post_path(@post), notice: 'Comment was successfully created.' }
        else
          @comments = @post.comments.all
          format.html { redirect_to post_path(@post), alert: "Comment can't be empty or over 300 characters." }
        end
      end
    else
      redirect_to root_path, alert: 'Please sign in to create a comment'
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @post = Post.find(@comment.post_id)
    if user_signed_in? && current_user.id == @comment.user_id
      respond_to do |format|
        if @comment.update(comment_params)
          @post = Post.find(@comment.post_id)
          format.html { redirect_to @post, notice: 'Comment was successfully updated.' }
          format.json { render :show, status: :ok, location: @comment }
        else
          format.html { render :edit, alert: 'There was an error saving the comment.' }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, alert: 'Please sign in to update a comment'
    end

  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    if user_signed_in? && current_user.id == @comment.user_id
      @comment.destroy
      respond_to do |format|
        @post = Post.find(@comment.post_id)
        format.html { redirect_to post_url(@post), notice: 'Comment was successfully deleted.' }
      end
    else
      redirect_to root_path, alert: 'The comment can only be deleted by the creator.'
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :post_id, :user_id)
    end
end
