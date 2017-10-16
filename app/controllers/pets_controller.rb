require 'httparty'
require 'dotenv/load'

class PetsController < ApplicationController

  def index
    petData = 'http://api.petfinder.com/pet.find?key='+ ENV['PETFINDER_KEY'] + '&animal=dog&location=98133&format=json'
    response = HTTParty.get(petData)
    @pet = response.parsed_response
    @pets = @pet['petfinder']['pets']['pet']


  end

end
