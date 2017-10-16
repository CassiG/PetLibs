require 'httparty'
require 'dotenv/load'

class PetsController < ApplicationController

  def index
    p params["type"]
    petData = 'http://api.petfinder.com/pet.find?key=' + ENV['PETFINDER_KEY'] + '&animal=' + params["type"] + '&location=98133&format=json'

    response = HTTParty.get(petData)
    @pet = response.parsed_response
    @pets = @pet['petfinder']['pets']['pet']

    p @pets
    p '*******************'

  end

end
