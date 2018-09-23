# frozen_string_literal: true

require 'test_helper'

class CombatControllerTest < ActionDispatch::IntegrationTest
  test 'should get lobby' do
    get combat_lobby_url
    assert_response :success
  end
end
