# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @user = create(:user)
    @report = create(:report, user: @user)
  end

  test '#editable? should return true when user is author' do
    assert @report.editable?(@user)
  end

  test '#editable? should return false when user is not author' do
    another_user = create(:user, email: 'bar@example.com')
    assert_not @report.editable?(another_user)
  end

  test '#created_on should return the day of the week and date when report was created' do
    report = create(:report, user: @user, created_at: Time.zone.parse('2021-12-31 12:00:00'))
    assert_equal Date.new(2021, 12, 31), report.created_on
  end
end
