# frozen_string_literal: true

class CreateCombats < ActiveRecord::Migration[5.2]
  def change
    create_table :combats do |t|
      t.references :winner, index: true, foreign_key: { to_table: :fighters, on_delete: :cascade }
      t.references :looser, index: true, foreign_key: { to_table: :fighters, on_delete: :cascade }

      t.timestamps
    end
  end
end
