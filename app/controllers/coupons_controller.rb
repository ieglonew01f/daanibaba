class CouponsController < InheritedResources::Base
  def index
      #get coupons_release_date
      release_date = Setting.find_by_name('coupons_release_date').value
      ds = release_date.split(' ')[0]

      date_passed = Date.parse(ds) < Date.today

      if date_passed
        #get coupon code where active is 1
        coupon = Coupon.where('active = ?', 1)

        if coupon.empty?
          render json: {status: 500, coupon: 'Internal Server Error ! Sorry please try again later.'}
          return
        end

        code = coupon.first.coupon_code

        if !code.empty?
          #destroy the coupon code in db set active = 0
          coupon.active = 0
          coupon.save
          render json: {status: 200, coupon: code}
        else
          render json: {status: 202, coupon: 'Sorry someone already took the coupon'}
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
