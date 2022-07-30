class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.references :election, null: false, foreign_key: true
      t.string :name
      t.string :street
      t.string :city
      t.string :telephone
      t.string :email
      t.integer :office

      t.timestamps
    end
  end
end
