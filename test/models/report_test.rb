# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @alpha = users(:alpha)
    @bravo = users(:bravo)
  end

  test '#editable? should return true when user is author' do
    report = @alpha.reports.create!(title: 'Hello', content: 'This is a first report!')
    assert report.editable?(@alpha)
  end

  test '#editable? should return false when user is not author' do
    report = @alpha.reports.create!(title: 'Hello', content: 'This is a first report!')
    assert_not report.editable?(@bravo)
  end

  test '#created_on should return the day of the week and date when report was created' do
    report = @alpha.reports.create!(title: 'Hello', content: 'This is a first report!', created_at: Time.zone.parse('2021-12-31 12:00:00'))
    assert_equal Date.new(2021, 12, 31), report.created_on
  end
end
