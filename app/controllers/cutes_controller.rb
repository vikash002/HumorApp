class CutesController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorized_user, only: [:edit, :update, :destroy]



  def index
    @cutes = Cute.all
    #respond_with(@gkeeys)
  end

  def show
    #respond_with(@gkeey)
  end

  def new
    @cute = current_user.cutes.build
    #respond_with(@gkeey)
  end

  def edit
  end

  def create
    @cute = current_user.cutes.build(cute_params)

    respond_to do |format|
      if @cute.save
        format.html { redirect_to @cute, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @cute }
      else
        format.html { render :new }
        format.json { render json: @cute.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cute.update(cute_params)
        format.html { redirect_to @cute, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @cute }
      else
        format.html { render :edit }
        format.json { render json: @cute.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cute.destroy
    respond_to do |format|
      format.html { redirect_to cutes_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @cute = Cute.find(params[:id])
    @cute.upvote_by current_user
    redirect_to :back
  end
  def downvote
    @cute = Cute.find(params[:id])
    @cute.downvote_from current_user
    redirect_to :back
  end

  private
  def set_link
    @cute = Cute.find(params[:id])
  end
  def authorized_user
    @cute = current_user.cutes.find_by(id: params[:id])
    redirect_to cutes_path, notice: "Not authorized to edit this link" if @cute.nil?
  end

  def cute_params
    params.require(:cute).permit(:title, :url)
  end
end
