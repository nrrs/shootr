class Api::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render 'api/comments/show'
    else
      render json: ["Failed to post comment"], status: 401
    end
  end

  def destroy
  end

  def show
  end

  private

  def comment_params
    params.require(:comment).permits(:body, :author_id, :post_id)
  end
end