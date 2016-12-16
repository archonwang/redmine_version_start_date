class StartDateVersion < ActiveRecord::Base
  unloadable
  belongs_to :version
end
