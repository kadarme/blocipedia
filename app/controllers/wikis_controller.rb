class WikisController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @wikis = policy_scope(Wiki).paginate(page: params[:page], per_page: 10)
  end

  def show
    @wiki = Wiki.find(params[:id])
    @collaboration = @wiki.collaborations.new
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end
  
  def create
    @wiki = Wiki.new(wiki_params)
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private, :user)
  end
    
end
