class MuseumController < ApplicationController

    def index
      @museums = Museum.all
      render json: @museums
    end

    def create
      @museum = Museum.new(museum_params)
      if @museum.save
        render json: @museum
      else
        render json: {error: 'Error creating museum'}
      end
    end

    def show
      @museum = Museum.find(params[:id])
      render json: @museum
    end

    def destroy
      @museum = Museum.find(params[:id])
      @museum.destroy
    end

    def update
      @museum = Museum.find(params[:id])
      @museum.update(name: params["museum"]["name"])
      @museum.save
      render json: @museum
    end

    private

    def account_params
      params.require(:museum).permit(:name)
    end


end