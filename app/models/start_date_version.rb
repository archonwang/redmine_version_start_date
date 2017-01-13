class StartDateVersion < ActiveRecord::Base
  belongs_to :version
  attr_accessible :start_date
end
