class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
    to: review.product.user.email,
    subject: "New Review for #{review.devtool.title}"
    )
  end
end
