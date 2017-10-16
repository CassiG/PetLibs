require 'httparty'
require 'dotenv/load'

class PetsController < ApplicationController

  def index
    p params
    @pet = Pet.new
  end

end
