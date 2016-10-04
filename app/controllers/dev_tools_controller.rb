class DevTools < ApplicationController
  def index
    @devtools = Devtool.all
  end

  def show
    @devtool = Devtool.find(params[:id])
    @reviews = @devtool.reviews
    @review = Review.new
  end

  def new
    @devtool = Devtool.new
  end

  def create
    @devtool = Devtool.new(devtool_params)
    if @devtool.save
      redirect_to devtool_path(@devtool.id), notice: "Dev Tool was posted"
    else
      @render 'new'
    end
  end

  private

    def devtool_params
      params.requre(:devtool).permit(:title, :body, :github_link)
    end

end
