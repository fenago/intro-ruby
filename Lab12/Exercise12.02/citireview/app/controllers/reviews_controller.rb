class ReviewsController < ApplicationController
    before_action :authenticate_user!

    def index
        @reviews = Review.all
    end

    def show
        @review = Review.find(params[:id])
    end

    def new 
    end

    def create
        parameters = params[:review]
        @review = Review.new(name: parameters[:name], description: parameters[:description])

        @review.save
        redirect_to @review
    end

    private
    def relationship_params
        params.require(:review).permit(:name, :description)
    end
end
