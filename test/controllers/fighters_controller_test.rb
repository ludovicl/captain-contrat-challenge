# frozen_string_literal: true

require 'test_helper'

class FightersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fighter = fighters(:one)
  end

  test 'should get index' do
    get fighters_url
    assert_response :success
  end

  test 'should get new' do
    get new_fighter_url
    assert_response :success
  end

  test 'should create fighter' do
    assert_difference('Fighter.count') do
      post fighters_url, params: { fighter: { attack_strength: @fighter.attack_strength,
                                              health_points: @fighter.health_points, name: @fighter.name } }
    end
  end

  test 'should show fighter' do
    get fighter_url(@fighter)
    assert_response :success
  end

  test 'should get edit' do
    get edit_fighter_url(@fighter)
    assert_response :success
  end

  test 'should update fighter' do
    patch fighter_url(@fighter), params: { fighter: { attack_strength: @fighter.attack_strength,
                                                      health_points: @fighter.health_points, name: @fighter.name } }
  end

  test 'should destroy fighter' do
    assert_difference('Fighter.count', -1) do
      delete fighter_url(@fighter)
    end

    assert_redirected_to fighters_url
  end
end
