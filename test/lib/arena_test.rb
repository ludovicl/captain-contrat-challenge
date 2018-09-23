# frozen_string_literal: true

require 'test_helper'
require 'arena'
class FightersControllerTest < ActionDispatch::IntegrationTest
  test 'fighter 2 should win' do
    result = Arena.result(fighters(:one), fighters(:two))
    assert_equal fighters(:two), result[:winner][:fighter]
  end

  test 'fighter 2 should win over fighter 3 without weapon' do
    result = Arena.result(fighters(:two), fighters(:three), nil, nil)
    assert_equal fighters(:two), result[:winner][:fighter]
  end

  test 'fighter 3 should win over fighter 2 with weapon' do
    result = Arena.result(fighters(:two), fighters(:three), nil, 'epée')
    assert_equal fighters(:three), result[:winner][:fighter]
  end
end
