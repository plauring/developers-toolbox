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
    @user = User.all
    @user.each do |user|
      @user = user.id
        if Vote.find_by(user_id: @user, review_id: @review.id).nil?
          Vote.create(user_id: @user, review_id: @review.id, status: true)
        else
          if Vote.find_by(user_id: @user, review_id: @review.id).status == true
            Vote.find_by(user_id: @user, review_id: @review.id).destroy
          else
            Vote.find_by(user_id: @user, review_id: @review.id).update(status: true)
          end
        end
      end
      @votes_for_review = @review.votes
      @upvote_count = []
      @downvote_count = []
        @votes_for_review.each do |vote|
          if vote.status == true
            @upvote_count << vote
          else
            @downvote_count << vote
          end
        end
        respond_to do |format|
          format.html { redirect_to :back }
          format.json { render :json => { upvotes: @upvote_count.length, downvotes: @downvote_count.length, sumvotes: (@upvote_count.length - @downvote_count.length) } }
          format.js
        end
  end
    #!IMPORTANT NOTICE: Until devise functionality is merged and we can use 'current_user' we are using User.all[0] as a stop gap.

  def downvote
    @review = Review.find(params[:id])
    @user = User.all
    @user.each do |user|
      @user = user.id
        if Vote.find_by(user_id: @user, review_id: @review.id).nil?
          Vote.create(user_id: @user, review_id: @review.id, status: false)
        else
          if Vote.find_by(user_id: @user, review_id: @review.id).status == false
            Vote.find_by(user_id: @user, review_id: @review.id).destroy
          else
            Vote.find_by(user_id: @user, review_id: @review.id).update(status: false)
          end
        end
      end
      @votes_for_review = @review.votes
      @downvote_count = []
      @upvote_count = []
        @votes_for_review.each do |vote|
          if vote.status == false
            @downvote_count << vote
          else
            @upvote_count << vote
          end
        end
        respond_to do |format|
          format.html { redirect_to :back }
          format.json { render :json => { downvotes: @downvote_count.length, upvotes: @upvote_count.length, sumvotes: (@upvote_count.length - @downvote_count.length) } }
          format.js
        end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating)

  end

end
