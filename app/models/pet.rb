require 'httparty'
require 'dotenv/load'

class Pet < ApplicationRecord

  def find_pet(animal)
    petData = 'http://api.petfinder.com/pet.find?key=' + ENV['PETFINDER_KEY'] + '&animal=' + animal + '&location=98133&format=json'

    response = HTTParty.get(petData)
    @pet = response.parsed_response
    @pets = @pet['petfinder']['pets']['pet']
  end

end
