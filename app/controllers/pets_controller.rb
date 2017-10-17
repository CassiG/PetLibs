require 'httparty'
require 'dotenv/load'

class PetsController < ApplicationController

  def index
    petData = 'http://api.petfinder.com/pet.find?key=' + ENV['PETFINDER_KEY'] + '&animal=' + params["type"] + + '&size=' + params["size"] + '&location=' + params["location"] + '&format=json'

    response = HTTParty.get(petData)
    @pet = response.parsed_response
    @pets = @pet['petfinder']['pets']['pet']

    @petList = []

    @pets.each do |pet|
      if pet['description']['$t'].include?(" #{params['description']}  ")
        @petList << pet
      end
    end
  end

end
