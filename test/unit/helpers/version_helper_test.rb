require File.expand_path('../../../test_helper', __FILE__)

class VersionsHelperTest < ActionView::TestCase
  def test_start_date_distance_in_words
    date = Time.zone.today.since 7.days
    assert_match 'Start in 7 days', start_date_distance_in_words(date)
  end
end
