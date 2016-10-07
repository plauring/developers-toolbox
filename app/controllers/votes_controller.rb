class VotesController < ApplicationController

    def upvote
      @review = Review.find(params[:id])
      @votes_for_review = @review.votes
      @votes.each do |vote|
        if vote.status == true
          respond_to do |format|
            format.html { redirect_to :back }
            format.json { render :json => { upvotes: @votes_for_review.length } }
            format.js
          end
        end
      end
    end
  end

  def downvote
    @review = Review.find(params[:id])
    @votes_for_review = @review.votes
    @votes.each do |vote|
      if vote.status == false
        respond_to do |format|
          format.html { redirect_to :back }
          format.json { render :json => { downvotes: @votes_for_review.length } }
          format.js
        end
      end
    end
  end

end
