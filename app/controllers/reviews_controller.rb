class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    user = User.find(session[:user_id])
    @comment = @product.reviews.create(review_text: review_params[:review_text], rating: review_params[:rating], user: user )
    redirect_to @product
  end

  private
    def review_params
      params.require(:review).permit(:review_text, :rating)
    end

end
