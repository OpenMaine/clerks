class CreateCampaignReports < ActiveRecord::Migration[7.0]
  def change
    create_table :campaign_reports do |t|
      t.references :campaign, null: false, foreign_key: true
      t.integer :type

      t.timestamps
    end
  end
end
