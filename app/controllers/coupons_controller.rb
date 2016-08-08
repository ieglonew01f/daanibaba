class CouponsController < InheritedResources::Base
  def index
      #get coupons_release_date
      release_date = Setting.find_by_name('coupons_release_date').value

      ds = release_date.split(' ')
      d1 = ds[0].split('-')
      d2 = ds[1].split(':')

      release_date_timestamp = Time.new(d1[0].to_i, d1[1].to_i, d1[2].to_i, d2[0].to_i, d2[1].to_i, 0, '+05:30').to_i
      current_time_stamp = Time.now.getlocal('+05:30').to_i

      date_passed = release_date_timestamp <= current_time_stamp

      if date_passed
        #get coupon code where active is 1
        coupon = Coupon.where('active = ?', 1)

        if coupon.empty?
          render json: {status: 500, coupon: 'Sorry someone already took the coupon, better luck next time :)'}
          return
        end

        code = coupon.first.coupon_code

        if !code.empty?
          #destroy the coupon code in db set active = 0
          coupon.first.active = 0
          coupon.first.save

          #set coupon winner
          coupon_winner = CouponWinner.new
          coupon_winner.coupon_id = coupon.first.id
          coupon_winner.ip = request.remote_ip
          coupon_winner.save

          render json: {status: 200, coupon: code}
        end
      else
        render json: {status: 422, coupon: 'No coupon for you'}
      end
  end

  private
    def coupon_params
      params.require(:coupon).permit(:coupon_code, :active)
    end
end
