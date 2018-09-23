# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Best way I found to attach avatar to Fighter
  # Not possible in fixtures yet : https://github.com/rails/rails/issues/33404
  Fighter.all.each do |f|
    f.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_avatar.png')),
                    filename: 'default-avatar.png', content_type: 'image/png')
    f.save
  end
  # Add more helper methods to be used by all tests here...
end
