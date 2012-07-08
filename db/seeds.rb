# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create the 0th question, specify the number of goods and bundles (combo is automatically created)
question0 = Question.create number: 0, number_of_goods: 3, number_of_bundles: 4

# update the attributes of the 3 goods owned by question0
# arrays are 0 indexed, so question0.goods[0] and question0.goods[1]
question0.goods[0].update_attributes number: 1, price: 0.5, utility: 1
question0.goods[1].update_attributes number: 2, price: 1.5, utility: 2
question0.goods[2].update_attributes number: 3, price: 2,   utility: 3

# update the 3 bundles owned by question 0
# goods_list is a comma separated list of goods identified by number, ie '0,1', or '2'
# value and utility are calculated and updated automatically
question0.bundles[0].update_attributes number: 1, lambda: 1.5, goods_list: '1'
question0.bundles[1].update_attributes number: 2, lambda: 1.2, goods_list: '1,3'
question0.bundles[2].update_attributes number: 3, lambda: 0.5, goods_list: '2,3'

# update the attributes of the combo (value and utility are calculated and updated automatically)
question0.combo.update_attributes price: 3, lambda: 1

# repeat the above for all your questions
