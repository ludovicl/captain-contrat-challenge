class Fighter < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :health_points, presence: true, allow_blank: false
  validates :attack_strength, presence: true, allow_blank: false


end
