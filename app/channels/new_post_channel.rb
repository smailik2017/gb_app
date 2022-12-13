class NewPostChannel < ApplicationCable::Channel
  def subscribed
    stream_from "new_post"
    Rails.logger.info("############# SERVER SUBSCRIBED #########")
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    Rails.logger.info("############# SERVER UNSUBSCRIBED #########")
    Rails.logger.info(params)
  end

  def new_post_event(data)
    Rails.logger.info("############# SERVER SPEAK #########")
    ActionCable.server.broadcast "new_post", { message: data["message"] }
  end

end
