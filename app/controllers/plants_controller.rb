class PlantsController < ApplicationController
    def index
        render json: Plant.all, except: [:created_at, :updated_at]
    end

    def show
        plant = Plant.all.find(params[:id])
        render json: plant, except: [:created_at, :updated_at]
    end

    def create
        new_plant = Plant.create(plants_params)
        render json: new_plant, except: [:created_at, :updated_at], status: :created
    end

    def update
        plant = Plant.all.find_by_name(params[:name])
        updatedplant = Plant.create(name: params[:name], image: params[:image])
        render json: updatedplant
    end

    private

    def plants_params
        params.permit(:name, :image, :price)
    end
end
