class ChangeIpColumnTypeInCouponWinner < ActiveRecord::Migration
  def change
    change_column :coupon_winners, :ip, :string
  end
end
