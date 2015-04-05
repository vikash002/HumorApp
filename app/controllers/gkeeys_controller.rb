class GkeeysController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorized_user, only: [:edit, :update, :destroy]



  def index
    @gkeeys = Gkeey.all
    #respond_with(@gkeeys)
  end

  def show
    #respond_with(@gkeey)
  end

  def new
    @gkeey = current_user.gkeeys.build
    #respond_with(@gkeey)
  end

  def edit
  end

  def create

  @gkeey = current_user.gkeeys.build(gkeey_params)

    respond_to do |format|
      if @gkeey.save
        format.html { redirect_to @gkeey, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @gkeey }
      else
        format.html { render :new }
        format.json { render json: @gkeey.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @gkeey.update(gkeey_params)
        format.html { redirect_to @gkeey, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @gkeey }
      else
        format.html { render :edit }
        format.json { render json: @gkeey.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @gkeey.destroy
    respond_to do |format|
      format.html { redirect_to gkeeys_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @gkeey = Gkeey.find(params[:id])
    @gkeey.upvote_by current_user
    redirect_to :back
  end
  def downvote
    @gkeey = Gkeey.find(params[:id])
    @gkeey.downvote_from current_user
    redirect_to :back
  end

  private
    def set_link
      @gkeey = Gkeey.find(params[:id])
    end
  def authorized_user
    @gkeey = current_user.gkeeys.find_by(id: params[:id])
    redirect_to gkeeys_path, notice: "Not authorized to edit this link" if @gkeey.nil?
  end

    def gkeey_params
      params.require(:gkeey).permit(:title, :url)
    end
end
