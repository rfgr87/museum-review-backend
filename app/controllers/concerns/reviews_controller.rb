class ReviewsController < ApplicationController

    before_action :set_account
  
    def index
      @reviews = Review.all
      render json: @reviews
    end
  
    def show
      @review = Review.find(params[:id])
      render json: @review
    end
  
    def create
      @review = @museum.review.new(review_params)
      if @review.save
        render json: @review
      else
        render json: {error: 'error creating review'}
      end
    end
  
    def destroy
      @review = Review.find(params["id"])
      @museum = Museum.find(@review.museum_id)
      if @review
        @review.destroy
        render json: @museum
      else
        render json: {error: 'review not found'}
      end
    end
  
    private
  
    def review_params
      params.require(:review).permit(:review, :museum_id)
    end
    
end