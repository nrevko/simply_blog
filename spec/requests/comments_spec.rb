require 'spec_helper'

describe "Categories" do
=begin
describe "Comments" do
  before do
    category=Category.create!(:category_name=>"two cats")
    category.save
  end
  describe "comments model" do
     fixtures :all
=end

=begin

    it "create new post" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers

     # puts "count #{Category.count}"

      #puts"category is here #{Category.all.last.id}"
      #Post.create!(:post_title=>"my new post", :post_text=>"here is new text", :category_id=>(Category.create!(:category_name=>"people")).id)
      #puts"category IS here #{category.id}"
      #get blog_path
      get posts_path
      response.body.should include("here is new text")
      response.body.should include("my new post")
    end
=end

  describe "GET /categories", :js => true  do

    it "displays categories" do
      Category.create!(:category_name=>"beavers")
      visit categories_path
      page.should have_content("beavers")
    end

    it "support js" do
      visit new_category_path
      click_link "test js"
      page.should have_content("js works")
    end
  end

  describe "POST /categories" do

    it "creates category" do
      visit new_category_path

      fill_in "Category name", :with=>"hair"
      click_button "Create Category"
      save_and_open_page
      page.should have_content("Category was successfully created.")
      page.should have_content("hair")
    end
  end
end