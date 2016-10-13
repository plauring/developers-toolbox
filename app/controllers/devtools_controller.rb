class DevtoolsController < ApplicationController
  before_action :authorize_user, except:[:index, :show, :new, :create]

  def index
    if params[:search] != ""
      @devtools = Devtool.search(params[:search])
    else
      @devtools = []
    end
  end

  def show
    @devtool = Devtool.find(params[:id])
    @reviews = @devtool.reviews
    @averageRate = Devtool.rate(@devtool)
  end

  def new
    @devtools = Devtool.all
    if !user_signed_in?
      flash[:notice] = 'Sign In or Sign Up to add a Dev tool for review.'
      redirect_to root_path
    else
      @devtool = Devtool.new
    end
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


  def destroy
    @devtool = Devtool.find(params[:id])
    dead_reviews = Review.where(devtool_id: params[:id] )
    if @devtool.destroy
      flash[:notice] = "Dev Tool Successfully Deleted!"
      dead_reviews.each do |review|
        review.destroy
      end
      redirect_to devtools_path
    else
      flash[:errors] = devtool.errors
      redirect_to @devtool
    end
  end

  private

  def devtool_params
    params.require(:devtool).permit(:title, :body, :github_link, :search)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Where ya goin?!@")
    end
  end

end
