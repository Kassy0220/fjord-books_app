# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#name_or_email should return email when unnamed user" do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email
  end

  test "#name_or_email should return name when named user" do
    user = User.new(email: 'foo@example.com', name: 'Foo')
    assert_equal 'Foo', user.name_or_email
  end
end
