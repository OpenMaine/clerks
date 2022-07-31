class CreateCampaignScheduleBs < ActiveRecord::Migration[7.0]
  def change
    create_table :campaign_schedule_bs do |t|
      t.references :campaign_report, null: false, foreign_key: true
      t.date :date
      t.string :payee
      t.integer :schedule_b_type
      t.string :description
      t.integer :amount

      t.timestamps
    end
  end
end
