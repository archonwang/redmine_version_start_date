class CreateStartDateVersions < ActiveRecord::Migration
  def change
    create_table :start_date_versions do |t|
      t.belongs_to :version, index: true, foreign_key: true
      t.date :start_date
    end
  end
end
