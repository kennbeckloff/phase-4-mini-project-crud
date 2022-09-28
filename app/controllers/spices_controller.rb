class SpicesController < ApplicationController
   
# GET /spices: return an array of all spices
    def index
        spices = Spice.all
        render json: spices
    end

# POST /spices: create a new spice 
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

# PATCH /spices/:id: update an existing spice
    def update
        spice = Spice.find(params[:id])
        spice.update(spice_params)
        render json: spice
    end

# DELETE /spices/:id: delete an existing spice
    def destroy
        spice = Spice.find(params[:id])
        spice.destroy
        render json: spice
    end
    private

    def find_spice
      Spice.find_by_id(params[:id])
    end
  
    def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
    end
  
    def render_not_found_response
      render json: { error: "Spice not found" }, status: :not_found
    end
    
end
