class ChangeValueFormatInSettings < ActiveRecord::Migration
  def change
    change_column :settings, :value, :string
  end
end
