require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "post must not be empty" do
    post = Post.new
    assert post.invalid?
    assert post.errors[:post_title].any?
    assert post.errors[:post_text].any?
    assert post.errors[:category_id].any?
  end

  test "post title must be unique" do
    post = Post.new(:post_title => posts(:one).post_title,
                    :post_text => "yyy",
                    :date_of_creation => "2011-02-02",
                    :category_id => 1)
    assert !post.save
    assert_equal "has already been taken", post.errors[:post_title].join(';')
  end

end
