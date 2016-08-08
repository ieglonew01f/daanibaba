class CreateCouponWinners < ActiveRecord::Migration
  def change
    create_table :coupon_winners do |t|
      t.integer :coupon_id
      t.integer :ip

      t.timestamps null: false
    end
  end
end
