require 'test_helper'

class CouponWinnersControllerTest < ActionController::TestCase
  setup do
    @coupon_winner = coupon_winners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coupon_winners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coupon_winner" do
    assert_difference('CouponWinner.count') do
      post :create, coupon_winner: { coupon_id: @coupon_winner.coupon_id, ip: @coupon_winner.ip }
    end

    assert_redirected_to coupon_winner_path(assigns(:coupon_winner))
  end

  test "should show coupon_winner" do
    get :show, id: @coupon_winner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coupon_winner
    assert_response :success
  end

  test "should update coupon_winner" do
    patch :update, id: @coupon_winner, coupon_winner: { coupon_id: @coupon_winner.coupon_id, ip: @coupon_winner.ip }
    assert_redirected_to coupon_winner_path(assigns(:coupon_winner))
  end

  test "should destroy coupon_winner" do
    assert_difference('CouponWinner.count', -1) do
      delete :destroy, id: @coupon_winner
    end

    assert_redirected_to coupon_winners_path
  end
end
