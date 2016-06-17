require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :products

  def new_cart_with_one_product(product_name)
    cart = Cart.create
    cart.add_product(products(product_name).id, 1)
    cart.save!
    cart
  end

  test "cart must add a new product" do
    cart = new_cart_with_one_product(:one)
    assert_equal 1, cart.line_items.to_a.count

    cart.add_product(products(:ruby).id, 1)
    assert_equal 2, cart.line_items.to_a.count
  end

  test "cart must sum a exists product" do
    cart = new_cart_with_one_product(:one)

    cart.add_product(products(:one).id, 1)
    assert_equal 1, cart.line_items.to_a.count
  end
end
