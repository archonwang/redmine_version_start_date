class StartDateVersion < ActiveRecord::Base
  unloadable
  belongs_to :version
  attr_accessible :start_date
end
