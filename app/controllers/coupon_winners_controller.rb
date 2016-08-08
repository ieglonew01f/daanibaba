class CouponWinnersController < InheritedResources::Base

  private
    def coupon_winner_params
      params.require(:coupon_winner).permit(:coupon_id, :ip)
    end
end
