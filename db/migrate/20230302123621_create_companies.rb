class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :fantasyname
      t.string :cnpj
      t.string :abbreviation

      t.timestamps
    end
  end
end
