# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "#editable? should return true when user is author" do
    alpha = User.create!(email: 'alpha@example.com', password: 'password')
    report = alpha.reports.create!(title: 'Hello', content: 'This is a first report!')
    assert report.editable?(alpha)
  end

  test "#editable? should return false when user is not author" do
    alpha = User.create!(email: 'alpha@example.com', password: 'password')
    bravo = User.create!(email: 'bravo@example.com', password: 'password')
    report = alpha.reports.create!(title: 'Hello', content: 'This is a first report!')
    assert_not report.editable?(bravo)
  end
end
