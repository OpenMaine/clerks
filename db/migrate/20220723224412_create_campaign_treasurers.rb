class CreateCampaignTreasurers < ActiveRecord::Migration[7.0]
  def change
    create_table :campaign_treasurers do |t|
      t.references :campaign, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.string :city
      t.string :email
      t.string :telephone

      t.timestamps
    end
  end
end
