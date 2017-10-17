require 'httparty'
require 'dotenv/load'

class PetsController < ApplicationController

  def index
    p params
    petData = 'http://api.petfinder.com/pet.find?key=' + ENV['PETFINDER_KEY'] + '&animal=' + params["animal"] + + '&size=' + params["animal-size"] + '&location=98133&format=json'

    response = HTTParty.get(petData)
    @pet = response.parsed_response
    @pets = @pet['petfinder']['pets']['pet']
    @petList = []

    @pets.each do |pet|
      if pet['name']['$t'].include?(" #{params['name']}  ") ||
         pet['description']['$t'].include?(" #{params['activity1']}  ") ||
         pet['description']['$t'].include?(" #{params['activity2']}  ") ||
         pet['description']['$t'].include?(" #{params['adjective']}  ") ||
         pet['description']['$t'].include?(" #{params['food']}  ") ||
         pet['description']['$t'].include?(" #{params['treat']}  ") ||
         pet['description']['$t'].include?(" #{params['adjective1']}  ") ||
         pet['description']['$t'].include?(" #{params['adjective2']}  ")
        @petList << pet
      end
    end
  end

end
