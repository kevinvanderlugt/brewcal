class RenameDashboardsToCalendars < ActiveRecord::Migration
  def change
    rename_table :dashboards, :calendars
    rename_column :brews, :dashboard_id, :calendar_id
  end
end
