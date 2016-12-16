require_dependency 'versions_helper'

module RedmineVersionStartDate
  module VersionsHelperPatch
    extend ActiveSupport::Concern

    def start_date_distance_in_words(date)
      if date && date > Date.today
        l(:label_roadmap_start_in, distance_of_date_in_words(Date.today, date))
      end
    end
  end

  ActionDispatch::Reloader.to_prepare do
    unless VersionsHelper.included_modules.include?(VersionsHelperPatch)
      VersionsHelper.send(:include, VersionsHelperPatch)
    end
  end
end
