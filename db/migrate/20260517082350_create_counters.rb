class CreateCounters < ActiveRecord::Migration[8.1]
  def change
    create_table :counters do |t|
      t.integer :plus, null: false, default: 0
      t.integer :minus, null: false, default: 0

      t.timestamps
    end
  end
end
