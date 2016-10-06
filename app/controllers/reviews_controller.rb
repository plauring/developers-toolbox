class ReviewsController < ApplicationController

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
      flash[:notice] = 'Review added successfully'
      redirect_to devtool_path(@devtool)
   else
      flash[:notice] = @review.errors.full_messages.join(',')
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating)

  end

end
