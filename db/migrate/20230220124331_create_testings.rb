class CreateTestings < ActiveRecord::Migration[7.0]
  def change
    create_table :testings do |t|
      t.string :username
      t.text :bio

      t.timestamps
    end
  end
end
