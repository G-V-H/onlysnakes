class ListingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user_listing, only: [:edit, :update, :destroy]
    before_action :set_listing, only: [:show]

    def index
        @listings = Listing.all
    end

    def show
    end

    def new
        breeds_sexes
        @listing = Listing.new
    end

    def create  

        @listing = current_user.listings.create(listing_params)
        if @listing.errors.any?
            breeds_sexes
            render "new"
        else
            redirect_to listings_path
        end
    end

    def edit
        breeds_sexes
    end

    def update
       # @listing = Listing.find(params[:id])
       # Listing.update(plant_params)
        #finsih logic for updating the record
        @listing = Listing.update(params[:id], listing_params)
        if @listing.errors.any?
            breeds_and_sexes
            render "edit"
        else 
            redirect_to listings_path
        end
    end

    def destroy
        Listing.find(params[:id]).destroy
        redirect_to listings_path
    end
    
    private 
    def breeds_sexes
        @breeds = Breed.all
        @sexes = Listing.sexes.keys
    end
    def set_user_listing()
        @listing = current_user.listings.find_by_id(params[:id])

        if @listing == nil 
            redirect_to listings_path
        end
    end
    def set_listing
        @listing = Listing.find(params[:id])
    end
    def listing_params
        params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :city, :state, :deposit, :date_of_birth, :diet, :picture)
    end
end
