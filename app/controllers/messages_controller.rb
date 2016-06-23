class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_user, only: [:index, :show]
  def index
    @requests = Message.all
  end

  def show
  end

  def create
    signature = request.env['HTTP_X_LINE_CHANNELSIGNATURE']
    return render_404 unless client.validate_signature(request.body.read, signature)
    result = params[:result][0]
    from = result[:content][:from]
    user = User.find_or_create_by(mid: from)
    content = result[:content][:text]
    message = user.messages.build(content: content,action: :received)

    if message.save
      client.send_text(
        to_mid: user.mid,
        text: "HI :#{message.content}",
      )
      render text: "OK"
    else
      render text: "ERROR"
    end

  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

end
