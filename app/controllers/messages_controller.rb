class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    # @messages = Message.all
    # @messages = Message.where(user_id: session[:user_id])

    @messages = Message.where(recipient: current_user[:email])
    @sent_messages = Message.where(user_id: session[:user_id])
    @username = current_user[:email]
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.user_id = session[:user_id] # get user_id
    @message.sender = current_user[:email] # and store it in message
    @message.wasread = false
    
    # # this is inefficient way to do this...
    @other_user = User.find_by(email: @message.recipient.downcase)
    @message.recipid = @other_user[:id]
    
    if @message.save
      # Handle a successful save
      flash[:success] = "Your message was successfully created."
      redirect_to @message
    else
      render 'new'
    end
    
    # respond_to do |format|
    #   if @message.save
    #     # format.html { redirect_to @message, success: 'Message was successfully created.' }
    #     # format.json { render :show, status: :created, location: @message }
    #     flash[:success] = "Message successfully created."
    #   else
    #     format.html { render :new }
    #     format.json { render json: @message.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    
    flash[:success] = "Your message was successfully deleted."
    redirect_to @message
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:recipient, :message)
    end
    
    # before filters ------------------------
    # confirm logged-in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in to view this page."
        redirect_to login_url
      end
    end
end
