class ReviewsController < ApplicationController

  def new
   @devtool = Devtool.find(params[:devtool_id])
   @review = Review.new
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

  def upvote
    @review = Review.find(params[:id])

    if Vote.find_by(user_id: 1, review_id: @review.id).nil?
      Vote.create(user_id: 1, review_id: @review.id, status: true)
    else
      if Vote.find_by(user_id: 1, review_id: @review.id).status == true
        Vote.find_by(user_id: 1, review_id: @review.id).destroy
      else
        Vote.find_by(user_id: 1, review_id: @review.id).update(status: true)
      end
    end
  end

  def downvote
    @review = Review.find(params[:id])

    if Vote.find_by(user_id: 1, review_id: @review.id).nil?
      Vote.create(user_id: 1, review_id: @review.id, status: false)
    else
      if Vote.find_by(user_id: 1, review_id: @review.id).status == false
        Vote.find_by(user_id: 1, review_id: @review.id).destroy
      else
        Vote.find_by(user_id: 1, review_id: @review.id).update(status: false)
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating)

  end

end
