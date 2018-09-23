# frozen_string_literal: true

json.extract! fighter, :id, :name, :health_points, :attack_strength, :created_at, :updated_at
json.url fighter_url(fighter, format: :json)
