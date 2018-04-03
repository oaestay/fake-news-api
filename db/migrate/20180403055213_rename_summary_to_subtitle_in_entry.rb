class RenameSummaryToSubtitleInEntry < ActiveRecord::Migration[5.1]
  def change
    rename_column :entries, :summary, :subtitle
  end
end
