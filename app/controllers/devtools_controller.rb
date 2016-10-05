class DevtoolsController < ApplicationController
  def index
    @devtools = Devtool.all
  end

  def show
    @devtool = Devtool.find(params[:id])
    @reviews = @devtool.reviews
  end

  def new
    @devtool = Devtool.new
  end

  def create
    @devtool = Devtool.new(devtool_params)
    if @devtool.save
      flash[:notice] = "Devtool added successfully"
      redirect_to devtool_path(@devtool.id)
    else
      flash[:notice] = @devtool.errors.full_messages.join(",")
      render 'new'
    end
  end

  def upvote
    @devtool = Devtool.find(params[:id])
    @reviews = @devtool.reviews.find(params[:id])
    @devtool.upvote.create
    redirect_to devtool_path(@devtool.id)
  end

  private

    def devtool_params
      params.require(:devtool).permit(:title, :body, :github_link)
    end

end
