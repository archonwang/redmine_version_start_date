Redmine::Plugin.register :redmine_version_start_date do
  name 'Redmine Version Start Date plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end

Dir[File.expand_path('../lib/redmine_version_start_date', __FILE__) << '/*.rb'].each do |file|
  require_dependency file
end
