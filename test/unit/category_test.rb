require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

 fixtures :categories
  # Replace this with your real tests.
  test "category must have non-empty name" do
    category = Category.new

    assert category.invalid?
    assert category.errors[:category_name].any?
  end

  test "category is not valid w/o unique name" do
    category = Category.new(:category_name => categories(:cats).category_name)

    assert !category.save
    assert_equal "has already been taken", category.errors[:category_name].join(';')
  end

end
