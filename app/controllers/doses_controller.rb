class DosesController < ApplicationController
    def new
        @cocktail = Cocktail.find(params[:cocktail_id])
        @dose = Dose.new
    end

    def create
        @cocktail = Cocktail.find(params[:cocktail_id])
        @ingredient = Ingredient.find(params[:dose][:ingredient_id])
        @dose = Dose.new(dose_params)
        @dose.cocktail = @cocktail
        @dose.ingredient = @ingredient
        @dose.save
        redirect_to cocktail_path(@cocktail)
        
    end

    private

    def dose_params
        params.require(:dose).permit(:description)
    end

end
