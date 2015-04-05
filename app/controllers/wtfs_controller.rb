class WtfsController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorized_user, only: [:edit, :update, :destroy]



  def index
    @wtfs = Wtf.all
    #respond_with(@gkeeys)
  end

  def show
    #respond_with(@gkeey)
  end

  def new
    @wtf = current_user.wtfs.build
    #respond_with(@gkeey)
  end

  def edit
  end

  def create
    @wtf = current_user.wtfs.build(wtf_params)

    respond_to do |format|
      if @wtf.save
        format.html { redirect_to @wtf, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @wtf }
      else
        format.html { render :new }
        format.json { render json: @wtf.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @wtf.update(wtf_params)
        format.html { redirect_to @wtf, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @wtf }
      else
        format.html { render :edit }
        format.json { render json: @wtf.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wtf.destroy
    respond_to do |format|
      format.html { redirect_to wtfs_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @wtf = Wtf.find(params[:id])
    @wtf.upvote_by current_user
    redirect_to :back
  end
  def downvote
    @wtf = Wtf.find(params[:id])
    @wtf.downvote_from current_user
    redirect_to :back
  end

  private
  def set_link
    @wtf = Wtf.find(params[:id])
  end
  def authorized_user
    @wtf = current_user.wtfs.find_by(id: params[:id])
    redirect_to @wtfs_path, notice: "Not authorized to edit this link" if @wtf.nil?
  end

  def wtf_params
    params.require(:meme).permit(:title, :url)
  end
end
