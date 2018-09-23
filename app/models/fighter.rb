# frozen_string_literal: true

class Fighter < ApplicationRecord
  has_one_attached :avatar, dependent: :destroy
  has_many :combats
  validates :name, presence: true, allow_blank: false, length: { maximum: 20 }
  validates :health_points, presence: true, allow_blank: false, numericality: { greater_than_or_equal_to: 1 }
  validates :attack_strength, presence: true, allow_blank: false, numericality: { greater_than_or_equal_to: 1 }
  validate :default_avatar
  validates :avatar, file_size: { less_than_or_equal_to: 1.megabyte },
                     file_content_type: { allow: ['image/jpeg', 'image/png'] }
  before_save :conform_health_points, :conform_attack_strength

  # Each attack hit with 80% to 120% damage of it attack_strength
  def attack
    (attack_strength * rand(0.8..1.2)).truncate(2)
  end

  def number_wins
    Combat.where(winner: self).count
  end

  def number_looses
    Combat.where(looser: self).count
  end

  private

  def default_avatar
    return if avatar.attached?

    avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_avatar.png')),
                  filename: 'default-avatar.png', content_type: 'image/png')
  end

  def full_info
    "#{name.titleize} : 🧡 #{health_points} 🥊 #{attack_strength}"
  end

  # Apply a random number on 100 if health_points are > 100
  def conform_health_points
    rng = rand(0.7..0.9)
    self.health_points = health_points > 100 * rng ? (100 * rng).to_i : health_points
  end

  # Apply a random number on 20 if attack_strength are > 100
  def conform_attack_strength
    rng = rand(0.7..0.9)
    self.attack_strength = attack_strength > 20 * rng ? (20 * rng).to_i : attack_strength
  end
end
