class CreateProbiotics < ActiveRecord::Migration[5.1]
  def change
    ActiveRecord::Base.connection.execute("CREATE EXTENSION IF NOT EXISTS citext;")

    create_table :probiotics do |t|
      t.citext :name, null: false, index: true
      t.timestamps null: false
    end
  end
end
