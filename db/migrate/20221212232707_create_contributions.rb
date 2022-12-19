class CreateContributions < ActiveRecord::Migration[7.0]
  def change
    create_table :contributions do |t|
      t.references :contributor, null: false, foreign_key: true
      t.references :campaign, null: false, foreign_key: true
      t.references :committee, null: false, foreign_key: true
      t.integer :amount
      t.string :description

      t.timestamps
    end
  end
end
