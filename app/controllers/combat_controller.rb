# frozen_string_literal: true

class CombatController < ApplicationController
  require 'arena'
  before_action :assign_fighter, only: :result

  def lobby
    @fighters = Fighter.all
    @weapons = JSON.parse(File.read('db/weapons.json')).map { |key, value| ["#{key.titleize} #{value['icone']}", key] }
  end

  def result
    @result = Arena.result(@fighter1, @fighter2, params["fighter"]["weapon_1"], params["fighter"]["weapon_2"])
  end

  def assign_fighter
    @fighter1 = Fighter.find(params['fighter']['1'])
    @fighter2 = Fighter.find(params['fighter']['2'])
  end
end
