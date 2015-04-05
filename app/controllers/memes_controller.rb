class MemesController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorized_user, only: [:edit, :update, :destroy]



  def index
    @memes = Meme.all
    #respond_with(@gkeeys)
  end

  def show
    #respond_with(@gkeey)
  end

  def new
    @meme = current_user.memes.build
    #respond_with(@gkeey)
  end

  def edit
  end

  def create
    @meme = current_user.memes.build(meme_params)

    respond_to do |format|
      if @meme.save
        format.html { redirect_to @meme, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @meme }
      else
        format.html { render :new }
        format.json { render json: @meme.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meme.update(meme_params)
        format.html { redirect_to @meme, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @meme }
      else
        format.html { render :edit }
        format.json { render json: @meme.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meme.destroy
    respond_to do |format|
      format.html { redirect_to memes_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @meme = Meme.find(params[:id])
    @meme.upvote_by current_user
    redirect_to :back
  end
  def downvote
    @meme = Meme.find(params[:id])
    @meme.downvote_from current_user
    redirect_to :back
  end

  private
  def set_link
    @meme = Meme.find(params[:id])
  end
  def authorized_user
    @meme = current_user.memes.find_by(id: params[:id])
    redirect_to @memes_path, notice: "Not authorized to edit this link" if @meme.nil?
  end

  def meme_params
    params.require(:meme).permit(:title, :url)
  end
end
