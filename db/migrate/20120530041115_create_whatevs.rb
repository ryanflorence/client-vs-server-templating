class CreateWhatevs < ActiveRecord::Migration
  def change
    create_table :whatevs do |t|
      t.string :foo
      t.integer :bar

      t.timestamps
    end
  end
end
