class CreateCampaignScheduleDs < ActiveRecord::Migration[7.0]
  def change
    create_table :campaign_schedule_ds do |t|
      t.date :date
      t.text :creditor
      t.text :purpose
      t.integer :amount
      t.references :campaign_report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
