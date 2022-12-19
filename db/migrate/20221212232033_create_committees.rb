class CreateCommittees < ActiveRecord::Migration[7.0]
  def change
    create_table :committees do |t|
      t.references :election, null: false, foreign_key: true
      t.string :name
      t.string :statement_of_committee_purpose
      t.string :type
      t.string :address
      t.string :city
      t.string :zip
      t.string :phone_number
      t.string :email
      t.string :treasurer_name
      t.string :treasurer_address
      t.string :treasurer_city
      t.string :treasurer_zip
      t.string :treasurer_phone_number
      t.string :treasurer_email

      t.timestamps
    end
  end
end
