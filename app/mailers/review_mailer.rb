class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    mail(
      to: review.devtool.user.email,
      subject: "New Review for #{review.devtool.title}"
    )
  end
end
