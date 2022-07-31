class CreateCampaignScheduleFs < ActiveRecord::Migration[7.0]
  def change
    create_table :campaign_schedule_fs do |t|
      t.references :campaign_report, null: false, foreign_key: true
      t.integer :receipts
      t.integer :payments
      t.integer :balance

      t.timestamps
    end
  end
end
