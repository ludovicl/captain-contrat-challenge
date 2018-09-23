# frozen_string_literal: true

class Combat < ApplicationRecord
  belongs_to :looser, class_name: 'Fighter', dependent: :destroy
  belongs_to :winner, class_name: 'Fighter', dependent: :destroy
end
