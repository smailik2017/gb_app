class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    logger.debug "got params #{params}"
    logger.debug "#{current_user}"

    if params[:color] == 'red'
      Like.create(user: current_user, post_id: params[:post_id])
    else
      Like.where(user: current_user, post_id: params[:post_id]).first.delete
    end
  end
end
  