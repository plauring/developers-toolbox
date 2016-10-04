class ReviewsController < ApplicationController

  def new
   @devtool = Devtool.find(params[:devtool_id])
   @review = Review.new(review_params)
   @review.devtool = @devtool
  end

 def create
   @devtool = Devtool.find(params[:devtool_id])
   @review = Review.new(review_params)
   @review.devtool = @devtool

   if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to devtool_path(@devtool)
   else
      flash[:notice] = @review.errors.full_messages.join(",")
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating) if params[:status]
  
  end

end
