# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

luffy = Fighter.find_or_create_by!(name: 'Luffy', health_points: 60, attack_strength: 15)
luffy.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'luffy.jpg')),
                    filename: 'luffy.png', content_type: 'image/png')
luffy.save!

jack = Fighter.find_or_create_by!(name: 'Jack Sparrow', health_points: 70, attack_strength: 10)
jack.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'jack_sparrow.png')),
                   filename: 'jack_sparrow.png', content_type: 'image/png')
jack.save!
