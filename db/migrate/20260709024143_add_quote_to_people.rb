class AddQuoteToPeople < ActiveRecord::Migration[8.1]
  def change
    add_reference :people, :quote, null: false, foreign_key: true
  end
end
