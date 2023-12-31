class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
