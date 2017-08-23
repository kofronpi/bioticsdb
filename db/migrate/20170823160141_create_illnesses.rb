class CreateIllnesses < ActiveRecord::Migration[5.1]
  def change
    create_table :illnesses do |t|
      t.citext :name, null: false, index: true, unique: true
      t.timestamps null: false
    end
  end
end
