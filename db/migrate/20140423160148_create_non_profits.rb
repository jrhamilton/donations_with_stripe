class CreateNonProfits < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    create_table :donations do |t|
      t.belongs_to :user
      t.belongs_to :non_profits
    end
  end
end
