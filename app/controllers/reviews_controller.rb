class ReviewsController < ApplicationController
  before_action :set_product

  def create
    @review = @product.reviews.build(review_params)
    @review.user_id = Current.user.id

    if @review.save
      redirect_to @product, notice: "Thank you for submitting a review!"
    else
      redirect_to @product, notice: "Unable to add review!"
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def review_params
    params.expect(review: [ :rating, :message ])
  end
end
