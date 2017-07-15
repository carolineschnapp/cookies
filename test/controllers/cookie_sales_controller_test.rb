require 'test_helper'

class CookieSalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cookie_sale = cookie_sales(:one)
  end

  test "should get index" do
    get cookie_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_cookie_sale_url
    assert_response :success
  end

  test "should create cookie_sale" do
    assert_difference('CookieSale.count') do
      post cookie_sales_url, params: { cookie_sale: { first_name: @cookie_sale.first_name, sale_date: @cookie_sale.sale_date, sales: @cookie_sale.sales } }
    end

    assert_redirected_to cookie_sale_url(CookieSale.last)
  end

  test "should show cookie_sale" do
    get cookie_sale_url(@cookie_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_cookie_sale_url(@cookie_sale)
    assert_response :success
  end

  test "should update cookie_sale" do
    patch cookie_sale_url(@cookie_sale), params: { cookie_sale: { first_name: @cookie_sale.first_name, sale_date: @cookie_sale.sale_date, sales: @cookie_sale.sales } }
    assert_redirected_to cookie_sale_url(@cookie_sale)
  end

  test "should destroy cookie_sale" do
    assert_difference('CookieSale.count', -1) do
      delete cookie_sale_url(@cookie_sale)
    end

    assert_redirected_to cookie_sales_url
  end
end
