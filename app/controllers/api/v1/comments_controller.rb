module Api
  module V1
    class CommentsController < ApplicationController
      def index
        render json: Comment.where(post_id: params[:post_id])
      end
  
      def create
        comment = Comment.new(comment_params)
        comment.author = current_user.email
        comment.save
        render json: comment
      end

      def destroy
        Comment.destroy(params[:id])
      end
  
      private
  
      def comment_params
        params.require(:comment).permit(:text, :post_id)
      end
    end
  end
end
