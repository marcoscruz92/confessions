class CreateConfessions < ActiveRecord::Migration
  def change
    create_table :confessions do |t|
      t.string :description

      t.timestamps
    end
  end
end
