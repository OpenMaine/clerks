class CreateCampaignScheduleA1s < ActiveRecord::Migration[7.0]
  def change
    create_table :campaign_schedule_a1s do |t|
      t.date :date
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :occupation
      t.string :employer
      t.integer :schedule_a1_type
      t.integer :amount
      t.string :description

      t.references :campaign_report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
