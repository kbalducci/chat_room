class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :like, :update, :destroy]

  # GET /chats
  # GET /chats.json
  def index
    @chats = Chat.all
    @chat = Chat.new
  end


  # GET /chats/1
  # GET /chats/1.json
  def show
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end
#changed this
  def user
    @chats = Chat.where(:name => params[:name])
    render :index
  end

  # GET /chats/1/edit
  def edit
  end
#changed this can i use like as name, what will that mess up
  def like
    if @chat.like.nil?
      @chat.like = 0
    end
    @chat.like += 1
    @chat.save!
    render json: @chat
  end

  # POST /chats
  # POST /chats.json
  def create
    @chat = Chat.new(chat_params)
    @chat.message = @chat.swear_filter
    respond_to do |format|
      if @chat.save
        format.html { redirect_to root_path, notice: 'Chat was successfully created.' }
        format.json { render json: @chat, status: :created, location: @chat }
      else
        format.html { render :new }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chats/1
  # PATCH/PUT /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: 'Chat was successfully updated.' }
        format.json { render json: @chat, status: :ok, location: @chat }
      else
        format.html { render :edit }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat.destroy
    respond_to do |format|
      format.html { redirect_to chats_url, notice: 'Chat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_params
      params.require(:chat).permit(:name, :message, :like, :photo)
    end
end
