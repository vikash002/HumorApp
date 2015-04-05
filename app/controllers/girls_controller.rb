class GirlsController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorized_user, only: [:edit, :update, :destroy]



  def index
    @girls = Girl.all
    #respond_with(@gkeeys)
  end

  def show
    #respond_with(@gkeey)
  end

  def new
    @girl = current_user.girls.build
    #respond_with(@gkeey)
  end

  def edit
  end

  def create
    @girl = current_user.girls.build(girl_params)

    respond_to do |format|
      if @girl.save
        format.html { redirect_to @girl, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @girl }
      else
        format.html { render :new }
        format.json { render json: @girl.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @girl.update(girl_params)
        format.html { redirect_to @girl, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @girl }
      else
        format.html { render :edit }
        format.json { render json: @girl.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @girl.destroy
    respond_to do |format|
      format.html { redirect_to girls_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @girl = Girl.find(params[:id])
    @girl.upvote_by current_user
    redirect_to :back
  end
  def downvote
    @girl = Girl.find(params[:id])
    @girl.downvote_from current_user
    redirect_to :back
  end

  private
  def set_link
    @girl = Girl.find(params[:id])
  end
  def authorized_user
    @girl = current_user.girls.find_by(id: params[:id])
    redirect_to girls_path, notice: "Not authorized to edit this link" if @girl.nil?
  end

  def girl_params
    params.require(:girl).permit(:title, :url)
  end
end
