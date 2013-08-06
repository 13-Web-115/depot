require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#menu a', minimum: 4
    assert_select '#main .templatemo_product_box', 3
    assert_select 'h3', 'Programming Ruby 1.9'
    assert_select 'h3', /\$[,\d]+\.\d\d/
  end
  test "markup needed for store.js.coffee is in place" do
    get :index
    assert_select '.store img', minimum: 3
    assert_select '.entry input[type=submit]', 0
  end
end
