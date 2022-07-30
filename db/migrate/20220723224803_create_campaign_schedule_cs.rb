class CreateCampaignScheduleCs < ActiveRecord::Migration[7.0]
  def change
    create_table :campaign_schedule_cs do |t|
      t.references :campaign, null: false, foreign_key: true
      t.text :lender
      t.integer :balance_at_beginning
      t.integer :amount_loaned
      t.integer :amount_repaid
      t.integer :amount_forgiven
      t.integer :balance

      t.timestamps
    end
  end
end
