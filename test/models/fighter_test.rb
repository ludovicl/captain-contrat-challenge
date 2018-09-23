# frozen_string_literal: true

require 'test_helper'

class FighterTest < ActiveSupport::TestCase
  test "can't insert nil named fighter" do
    fighter = Fighter.create(name: nil)
    assert_equal "Name can't be blank", fighter.errors.full_messages[0]
  end

  test "can't insert nil health_points fighter" do
    fighter = Fighter.create(name: 'foo', health_points: nil)
    assert_equal "Health points can't be blank", fighter.errors.full_messages[0]
  end

  test "can't insert nil attack_strength fighter" do
    fighter = Fighter.create(name: 'foo', health_points: 1, attack_strength: nil)
    assert_equal "Attack strength can't be blank", fighter.errors.full_messages[0]
    assert_equal 'Attack strength is not a number', fighter.errors.full_messages[1]
  end
end
