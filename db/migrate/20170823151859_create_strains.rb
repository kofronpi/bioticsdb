class CreateStrains < ActiveRecord::Migration[5.1]
  def change
    create_table :strains do |t|
      t.belongs_to :probiotic, foreign_key: true, index: true
      t.jsonb :data
      t.timestamps null: false
    end
  end
end
