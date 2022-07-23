class CreateCampaignScheduleAs < ActiveRecord::Migration[7.0]
  def change
    create_table :campaign_schedule_as do |t|
      t.references :campaign, null: false, foreign_key: true
      t.date :date
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :occupation
      t.string :employer
      t.integer :type
      t.integer :amount
      t.text :description

      t.timestamps
    end
  end
end
