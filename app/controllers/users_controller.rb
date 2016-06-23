class UsersController < ApplicationController
  before_action :find_user,only: [:show, :edit, :update, :send_text]
  def index
    @users = User.all
    @messages = Message.all
  end

  def send_text
    text = params[:text].to_s
    begin
    client.send_text(to_mid: @user.mid, text:text)
    rescue
      return render json: {status:'error'}
    end
    @user.messages.create(content: text, action: :sent)
    render json: {status: 'ok',text: text}
  end

  def show

  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  private

  def find_user
    @user =User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end