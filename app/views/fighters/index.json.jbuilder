# frozen_string_literal: true

json.array! @fighters, partial: 'fighters/fighter', as: :fighter
