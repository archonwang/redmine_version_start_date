module RedmineVersionStartDate
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_projects_roadmap_version_bottom, partial: 'versions/view_projects_roadmap_version_bottom_hook'
    render_on :view_versions_show_bottom, partial: 'versions/view_projects_roadmap_version_bottom_hook'
    render_on :view_layouts_base_html_head, partial: 'layouts/view_layouts_base_html_head_hook'
  end
end
