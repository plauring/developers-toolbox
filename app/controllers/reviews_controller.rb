class ReviewsController < ApplicationController
  before_action :authorize_user, except:[:new, :create]

  def new
    @devtool = Devtool.find(params[:devtool_id])
    if !user_signed_in?
      flash[:notice] = 'You must be signed in to post a review'
      redirect_to devtool_path(@devtool.id)
    else
       @devtool = Devtool.find(params[:devtool_id])
       @review = Review.new
       @review.devtool = @devtool
    end
  end

  def create
    @devtool = Devtool.find(params[:devtool_id])
    @review = Review.new(review_params)
    @review.devtool = @devtool


    if @review.save
      ReviewMailer.new_review(@review).deliver_later
      flash[:notice] = "Review added successfully"
      redirect_to devtool_path(@devtool)
    else
      flash[:notice] = @review.errors.full_messages.join(',')
      render :new
    end
  end

 def destroy
   @devtool = Devtool.find(params[:id])
   @reviews = Review.all
   @reviews.each do |review|
     if review.destroy
       flash[:success] = 'Review Successfully Deleted!'
     else
       flash[:errors] = @devtool.errors
     end
    redirect_to devtool_path(@devtool)
  end
 end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating)
<<<<<<< HEAD
=======
  end
>>>>>>> cb1a9ede72bf91ba5ca6692078f22ab56b023694

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Where ya goin?!@")
    end
  end

end
