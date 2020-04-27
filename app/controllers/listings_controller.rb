class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    
    def index
        @listings = Listing.all
    end

    def show
        @listing = Listing.find(params[:id])
    end

    def new
        @breeds = Breed.all
        @sexes = Listing.sexes.keys
        @listing = Listing.new
    end

    def create  

        @listing = Listing.create(listing_params)
        if @listing.errors.any?
            @breeds = Breed.all
            @sexes = Listing.sexes.keys
            render "new"
        else
            redirect_to listings_path
        end
    end

    def edit
        @breeds = Breed.all
        @sexes = Listing.sexes.keys
        @listing = Listing.new
    end

    def update
        @listing = Listing.find(params[:id])
        Listing.update(plant_params)
        #finsih logic for updating the record
    end

    def destroy

        #finish logic for deleting the record
    end
    
    private 
    def set_listing()
        @listing = Listing.find(params[:id])
    end
    def listing_params
        params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :city, :state, :deposit, :date_of_birth, :diet, :picture)
    end
end
