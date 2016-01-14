class AddNameAndPhNumberToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :name, :string
    add_column :addresses, :phone_number, :string
  end
end
