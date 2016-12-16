require_dependency 'version'

module RedmineVersionStartDate
  module VersionPatch
    extend ActiveSupport::Concern

    included do
      unloadable
      has_one :start_date_version, dependent: :destroy
      alias_method :origin_start_date, :start_date
      alias_method :start_date, :mod_start_date
      accepts_nested_attributes_for :start_date_version
    end

    def mod_start_date
      if start_date_version.present? && start_date_version.start_date.present?
        start_date_version.start_date
      else
        origin_start_date
      end
    end
  end
end

ActionDispatch::Reloader.to_prepare do
  unless Version.included_modules.include?(RedmineVersionStartDate::VersionPatch)
    Version.send(:include, RedmineVersionStartDate::VersionPatch)
  end
end
