class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /links
  # GET /links.json
  def index
    @links = Link.order(totalcount: :DESC)
    @links = Link.order(:url).page params[:page]
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @links = Link.find(params[:id])
  end

  # GET /links/new
  def new
    @links = Link.new
  end

  # GET /links/1/edit
  def edit
    @links = Link.find(params[:id])
  end

  # POST /links
  # POST /links.json
  def create
    @links = Link.new(link_params)
    @links.user = current_user
    @links.totalcount = @links.votes.count
      if @links.save
        redirect_to @links
      else
        render :new
      end
  end

  def vote
    @link = Link.find(params[:link_id])
    @link.votes << Vote.create!(user_id: @link.user_id, link_id: @link.id)
    @link.totalcount = @link.votes.count
    @link.save
    redirect_to :root
  end


  def down_vote
    @link = Link.find(params[:link_id])
    @link.votes.last.destroy
    @link.totalcount = @link.votes.count
    @link.save
    redirect_to :root
  end

  def link_vote
    @link = Link.find(params[:link_id])
    @link.votes << Vote.create!(user_id: @link.user_id, link_id: @link.id)
    @link.totalcount = @link.votes.count
    @link.save
    redirect_to @link.url
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    @links.update(link_params)
    @links.save
    redirect_to :root
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @links.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @links = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:url, :title, :link_id)
    end
end
