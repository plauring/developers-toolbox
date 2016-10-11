class DevtoolsController < ApplicationController
  def index
    @devtools = Devtool.search(params[:search])
  end

  def show
    @devtool = Devtool.find(params[:id])
    @reviews = @devtool.reviews
    @averageRate = Devtool.rate(@devtool)
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

  private

    def devtool_params
      params.require(:devtool).permit(:title, :body, :github_link, :search)
    end

end
