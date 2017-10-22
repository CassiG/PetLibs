require 'httparty'
require 'dotenv/load'

class PetsController < ApplicationController

  def index
    petData = 'http://api.petfinder.com/pet.find?key=' + ENV['PETFINDER_KEY'] + '&animal=' + params["animal"] + + '&size=' + params["animal-size"] + '&location=98133&format=json'

    response = HTTParty.get(petData)
    @pet = response.parsed_response
    @pets = @pet['petfinder']['pets']['pet']
    @petNameList = []
    @petDescriptionList = []
    @petFoodList = []
    @petList = []

    @pets.each do |pet|

      petDescription = pet['description']['$t']

      if petDescription != nil && petDescription.include?(" #{params['activity']}  ") ||
            pet['description']['$t'].include?(" #{params['adjective1']}  ") ||
            pet['description']['$t'].include?(" #{params['adjective']}  ")
        @petDescriptionList << pet
      end

    end

    p @petNameList
    p @petDescriptionList
    p @petFoodList
  end

end
