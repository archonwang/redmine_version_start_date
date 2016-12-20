require File.expand_path('../../test_helper', __FILE__)

class StartDateVersionTest < ActiveSupport::TestCase
  fixtures :projects, :users, :issues, :issue_statuses, :trackers,
           :enumerations, :versions, :projects_trackers

  test '#start_date should be start_date of StartDateVersion without start_date of Issue' do
    start_date = Time.zone.today
    version = Version.create project: Project.find(1),
                             name: '1.1',
                             start_date: start_date
    add_issue(version, start_date: 7.days.ago)

    assert_equal start_date, version.start_date
    assert_equal start_date, version.start_date_version.start_date
  end

  test '#start_date should be start_date of earliest start_date of Issue when do not has StartDateVersion' do
    start_date = 7.days.ago.to_date
    version = Version.create project: Project.find(1), name: '1.1'
    add_issue(version, start_date: start_date)

    assert_equal start_date, version.start_date
    assert_equal nil, version.start_date_version
  end

  test '#start_date should be nil when do not has start_date of Issue or StartDateVersion' do
    version = Version.create project: Project.find(1), name: '1.1'
    add_issue(version)

    assert_equal nil, version.start_date
    assert_equal nil, version.start_date_version
  end

  private

  def add_issue(version, attributes = {})
    Issue.create!({
      project: version.project,
      fixed_version: version,
      subject: 'Test',
      author: User.first,
      tracker: version.project.trackers.first}.merge(attributes))
  end
end
