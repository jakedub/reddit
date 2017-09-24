class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    @link.user = current_user
    @link.vote_count = @link.votes.count
      if @link.save
        redirect_to @link
      else
        render :new
      end
    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def vote
    if current_user
      @link.votes << Vote.create!(user_id: @link.user_id, link_id: @link.id)
      @link.vote_count = @link.votes.count
      @link.save
      redirect_to :root
    else
      redirect_to :login
    end
  end

  def link_vote
    @link.votes << Vote.create!(user_id: @link.user_id, link_id: @link.id)
    @link.vote_count = @link.vote.count
    @link.save
    redirect_to @link.link
  end

  def down_vote
    @link.votes.last.destroy
    @link.vote_count = @link.votes.count
    @link.save
    redirect_to :root
  end


  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    @link.update(link_params)
    @link.save
    redirect_to :root
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def upvote
  #   @link = Link.find(params[:id])
  #   @link.upvote_by current_user
  #   redirect_to :back
  # end
  #
  # def downvote
  #   @link = Link.find(params[:id])
  #   @link.downvote_from current_user
  #   redirect_to :back
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:url, :title)
    end
end
