# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Category.delete_all

Category.create(:category_name => 'dogs')
Category.create(:category_name => 'cats')
Category.create(:category_name => 'monkeys')
Category.create(:category_name => 'elephants')
Category.create(:category_name => 'donkeys')
Category.create(:category_name => 'non-animals')

Post.create(:post_title => "Zoo",
            :post_text =>%{<p>Treatment of animals in local zoo has proven to be increasingly cruel</p>},
            :date_of_creation =>"2011-06-05",
            :category_id =>3)

Post.create(:post_title => "Animal Planet",
            :post_text => %{We are all animals in this world - homo sapiens},
            :date_of_creation =>"2010-01-01",
            :category_id =>4)

Post.create(:post_title => "Adoption Fair",
            :post_text =>%{<p>"Please, Adopt me!" - Lots of screaming pets are gathering next Sunday
                          in the Parkview in hope to find their permanent home.</p>},
            :date_of_creation =>"2009-02-03",
            :category_id =>2)
