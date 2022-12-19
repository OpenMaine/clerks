class CreateContributors < ActiveRecord::Migration[7.0]
  def change
    create_table :contributors do |t|
      t.string :name
      t.text :description
      t.string :zip

      t.timestamps
    end
  end
end
