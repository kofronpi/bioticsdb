class CreateEffects < ActiveRecord::Migration[5.1]
  def change
    create_table :effects do |t|
      t.citext :name, null: false, index: true, unique: true
      t.timestamps null: false
    end

    create_join_table :illnesses, :strains do |t|
      t.index :illness_id
      t.index :strain_id
    end

    create_join_table :effects, :strains do |t|
      t.index :effect_id
      t.index :strain_id
    end
  end
end
