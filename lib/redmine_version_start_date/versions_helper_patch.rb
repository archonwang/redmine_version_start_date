require_dependency 'versions_helper'

module RedmineVersionStartDate
  module VersionsHelperPatch
    extend ActiveSupport::Concern

    def start_date_distance_in_words(date, options = {})
      I18n.with_options locale: options[:locale] do |locale|
        locale.t(:label_roadmap_start_in, value: distance_of_date_in_words(Time.zone.today, date))
      end if date.present? && date > Time.zone.today
    end
  end

  ActionDispatch::Reloader.to_prepare do
    unless VersionsHelper.included_modules.include?(VersionsHelperPatch)
      VersionsHelper.send(:include, VersionsHelperPatch)
    end
  end
end
