# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "q0"
# create the 0th question, specify the number of goods and bundles (combo is automatically created)
question0 = Question.create number: 0, number_of_goods: 3, number_of_bundles: 3

# update the attributes of the 3 goods owned by question0
# arrays are 0 indexed, so question0.goods[0] and question0.goods[1]
question0.goods[0].update_attributes number: 1, price: 0.5, value: 1
question0.goods[1].update_attributes number: 2, price: 1.5, value: 2
question0.goods[2].update_attributes number: 3, price: 2,   value: 3

# update the 3 bundles owned by question 0
# goods_list is a comma separated list of goods identified by number, ie '0,1', or '2'
# value and utility are calculated and updated automatically
question0.bundles[0].update_attributes number: 1, lambda: 1.5, goods_list: '1,2'
question0.bundles[1].update_attributes number: 2, lambda: 1.2, goods_list: '1,3'
question0.bundles[2].update_attributes number: 3, lambda: 0.5, goods_list: '2,3'

# update the attributes of the combo (value and utility are calculated and updated automatically)
question0.combo.update_attributes price: 2.75, lambda: 1

# repeat the above for all your questions
puts "q1"
question1 = Question.create number: 1, number_of_goods: 4, number_of_bundles: 10

question1.goods[0].update_attributes number: 1, price: 1.75, value: 1
question1.goods[1].update_attributes number: 2, price: 2, value: 2
question1.goods[2].update_attributes number: 3, price: 2.25,   value: 3
question1.goods[3].update_attributes number: 4, price: 2.75,   value: 4

question1.bundles[0].update_attributes number: 1, lambda: 1.5, goods_list: '1,2'
question1.bundles[1].update_attributes number: 2, lambda: 1.25, goods_list: '1,3'
question1.bundles[2].update_attributes number: 3, lambda: 1.1, goods_list: '1,4'
question1.bundles[3].update_attributes number: 4, lambda: 1.1, goods_list: '2,3'
question1.bundles[4].update_attributes number: 5, lambda: 1.1, goods_list: '2,4'
question1.bundles[5].update_attributes number: 6, lambda: 0.9, goods_list: '3,4'
question1.bundles[6].update_attributes number: 7, lambda: 0.9, goods_list: '1,2,3'
question1.bundles[7].update_attributes number: 8, lambda: 0.9, goods_list: '1,2,4'
question1.bundles[8].update_attributes number: 9, lambda: 0.9, goods_list: '1,3,4'
question1.bundles[9].update_attributes number: 10, lambda: 0.8, goods_list: '2,3,4'

question1.combo.update_attributes price: 8.5, lambda: 1.0
puts "q2"
question2 = Question.create number: 2, number_of_goods: 5, number_of_bundles: 25

question2.goods[0].update_attributes number: 1, price: 2.75, value: 1
question2.goods[1].update_attributes number: 2, price: 1.75, value: 2
question2.goods[2].update_attributes number: 3, price: 3.25,   value: 3
question2.goods[3].update_attributes number: 4, price: 2.5,   value: 4
question2.goods[4].update_attributes number: 5, price: 3.25,   value: 5

question2.bundles[0].update_attributes number: 1, lambda: 1.75, goods_list: '1,2'
question2.bundles[1].update_attributes number: 2, lambda: 1.75, goods_list: '1,3'
question2.bundles[2].update_attributes number: 3, lambda: 1.25, goods_list: '1,4'
question2.bundles[3].update_attributes number: 4, lambda: 1.1, goods_list: '1,5'
question2.bundles[4].update_attributes number: 5, lambda: 1.25, goods_list: '2,3'
question2.bundles[5].update_attributes number: 6, lambda: 1.0, goods_list: '2,4'
question2.bundles[6].update_attributes number: 7, lambda: 0.9, goods_list: '2,5'
question2.bundles[7].update_attributes number: 8, lambda: 1.1, goods_list: '3,4'
question2.bundles[8].update_attributes number: 9, lambda: 1.0, goods_list: '3,5'
question2.bundles[9].update_attributes number: 10, lambda: 0.75, goods_list: '4,5'
question2.bundles[10].update_attributes number: 11, lambda: 1.5, goods_list: '1,2,3'
question2.bundles[11].update_attributes number: 12, lambda: 1.2, goods_list: '1,2,4'
question2.bundles[12].update_attributes number: 13, lambda: 1.25, goods_list: '1,2,5'
question2.bundles[13].update_attributes number: 14, lambda: 1.1, goods_list: '1,3,4'
question2.bundles[14].update_attributes number: 15, lambda: 1.1, goods_list: '1,3,5'
question2.bundles[15].update_attributes number: 16, lambda: 0.9, goods_list: '1,4,5'
question2.bundles[16].update_attributes number: 17, lambda: 1.0, goods_list: '2,3,4'
question2.bundles[17].update_attributes number: 18, lambda: 1.0, goods_list: '2,3,5'
question2.bundles[18].update_attributes number: 19, lambda: 0.75, goods_list: '2,4,5'
question2.bundles[19].update_attributes number: 20, lambda: 0.9, goods_list: '3,4,5'
question2.bundles[20].update_attributes number: 21, lambda: 1.1, goods_list: '1,2,3,4'
question2.bundles[21].update_attributes number: 22, lambda: 0.9, goods_list: '2,3,4,5'
question2.bundles[22].update_attributes number: 23, lambda: 1.1, goods_list: '1,2,3,5'
question2.bundles[23].update_attributes number: 24, lambda: 1.0, goods_list: '1,3,4,5'
question2.bundles[24].update_attributes number: 25, lambda: 0.9, goods_list: '1,2,4,5'

question2.combo.update_attributes price: 13, lambda: 1.0


#question 3
puts "q3"
question3 = Question.create number: 3, number_of_goods: 4, number_of_bundles: 10, display_equation: true

question3.goods[0].update_attributes number: 1, price: 1.75, value: 1
question3.goods[1].update_attributes number: 2, price: 2, value: 2
question3.goods[2].update_attributes number: 3, price: 2.25,   value: 3
question3.goods[3].update_attributes number: 4, price: 2.75,   value: 4

question3.bundles[0].update_attributes number: 1, lambda: 1.6, goods_list: '1,2'
question3.bundles[1].update_attributes number: 2, lambda: 1.25, goods_list: '1,3'
question3.bundles[2].update_attributes number: 3, lambda: 1.0, goods_list: '1,4'
question3.bundles[3].update_attributes number: 4, lambda: 1.1, goods_list: '2,3'
question3.bundles[4].update_attributes number: 5, lambda: 1.0, goods_list: '2,4'
question3.bundles[5].update_attributes number: 6, lambda: 0.8, goods_list: '3,4'
question3.bundles[6].update_attributes number: 7, lambda: 1.1, goods_list: '1,2,3'
question3.bundles[7].update_attributes number: 8, lambda: 1.1, goods_list: '1,2,4'
question3.bundles[8].update_attributes number: 9, lambda: 1.1, goods_list: '1,3,4'
question3.bundles[9].update_attributes number: 10, lambda: 0.9, goods_list: '2,3,4'

question3.combo.update_attributes price: 8.5, lambda: 1

#question 4
puts "q4"
question4 = Question.create number: 4, number_of_goods: 5, number_of_bundles: 25, display_equation: true

question4.goods[0].update_attributes number: 1, price: 2.25, value: 1
question4.goods[1].update_attributes number: 2, price: 2.25, value: 2
question4.goods[2].update_attributes number: 3, price: 3.25,   value: 3
question4.goods[3].update_attributes number: 4, price: 2.75,   value: 4
question4.goods[4].update_attributes number: 5, price: 3,   value: 5

question4.bundles[0].update_attributes number: 1, lambda: 1.75, goods_list: '1,2'
question4.bundles[1].update_attributes number: 2, lambda: 1.75, goods_list: '1,3'
question4.bundles[2].update_attributes number: 3, lambda: 1.25, goods_list: '1,4'
question4.bundles[3].update_attributes number: 4, lambda: 1.1, goods_list: '1,5'
question4.bundles[4].update_attributes number: 5, lambda: 1.25, goods_list: '2,3'
question4.bundles[5].update_attributes number: 6, lambda: 1.0, goods_list: '2,4'
question4.bundles[6].update_attributes number: 7, lambda: 0.9, goods_list: '2,5'
question4.bundles[7].update_attributes number: 8, lambda: 1.1, goods_list: '3,4'
question4.bundles[8].update_attributes number: 9, lambda: 1.0, goods_list: '3,5'
question4.bundles[9].update_attributes number: 10, lambda: 0.75, goods_list: '4,5'
question4.bundles[10].update_attributes number: 11, lambda: 1.5, goods_list: '1,2,3'
question4.bundles[11].update_attributes number: 12, lambda: 1.25, goods_list: '1,2,4'
question4.bundles[12].update_attributes number: 13, lambda: 1.1, goods_list: '1,2,5'
question4.bundles[13].update_attributes number: 14, lambda: 1.1, goods_list: '1,3,4'
question4.bundles[14].update_attributes number: 15, lambda: 1.2, goods_list: '1,3,5'
question4.bundles[15].update_attributes number: 16, lambda: 0.9, goods_list: '1,4,5'
question4.bundles[16].update_attributes number: 17, lambda: 1.0, goods_list: '2,3,4'
question4.bundles[17].update_attributes number: 18, lambda: 1.0, goods_list: '2,3,5'
question4.bundles[18].update_attributes number: 19, lambda: 0.75, goods_list: '2,4,5'
question4.bundles[19].update_attributes number: 20, lambda: 0.9, goods_list: '3,4,5'
question4.bundles[20].update_attributes number: 21, lambda: 1.1, goods_list: '1,2,3,4'
question4.bundles[21].update_attributes number: 22, lambda: 0.9, goods_list: '2,3,4,5'
question4.bundles[22].update_attributes number: 23, lambda: 1.1, goods_list: '1,2,3,5'
question4.bundles[23].update_attributes number: 24, lambda: 0.9, goods_list: '1,3,4,5'
question4.bundles[24].update_attributes number: 25, lambda: 0.9, goods_list: '1,2,4,5'

question4.combo.update_attributes price: 13, lambda: 1.0

#question 5
puts "q5"
question5 = Question.create number: 5, number_of_goods: 4, number_of_bundles: 10

question5.goods[0].update_attributes number: 1, price: 1.5, value: 1
question5.goods[1].update_attributes number: 2, price: 2.25, value: 2
question5.goods[2].update_attributes number: 3, price: 2,   value: 3
question5.goods[3].update_attributes number: 4, price: 2.25,   value: 4

question5.bundles[0].update_attributes number: 1, lambda: 1.5, goods_list: '1,2'
question5.bundles[1].update_attributes number: 2, lambda: 1.25, goods_list: '1,3'
question5.bundles[2].update_attributes number: 3, lambda: 1.1, goods_list: '1,4'
question5.bundles[3].update_attributes number: 4, lambda: 1.1, goods_list: '2,3'
question5.bundles[4].update_attributes number: 5, lambda: 1.2, goods_list: '2,4'
question5.bundles[5].update_attributes number: 6, lambda: 0.9, goods_list: '3,4'
question5.bundles[6].update_attributes number: 7, lambda: 1.1, goods_list: '1,2,3'
question5.bundles[7].update_attributes number: 8, lambda: 1.1, goods_list: '1,2,4'
question5.bundles[8].update_attributes number: 9, lambda: 0.9, goods_list: '1,3,4'
question5.bundles[9].update_attributes number: 10, lambda: 0.9, goods_list: '2,3,4'

question5.combo.update_attributes price: 7.75, lambda: 1

#question 6

question6 = Question.create number: 6, number_of_goods: 5, number_of_bundles: 25

question6.goods[0].update_attributes number: 1, price: 2.25, value: 1
question6.goods[1].update_attributes number: 2, price: 1.75, value: 2
question6.goods[2].update_attributes number: 3, price: 3.25,   value: 3
question6.goods[3].update_attributes number: 4, price: 2.5,   value: 4
question6.goods[4].update_attributes number: 5, price: 3.75,   value: 5

question6.bundles[0].update_attributes number: 1, lambda: 1.75, goods_list: '1,2'
question6.bundles[1].update_attributes number: 2, lambda: 1.75, goods_list: '1,3'
question6.bundles[2].update_attributes number: 3, lambda: 1.25, goods_list: '1,4'
question6.bundles[3].update_attributes number: 4, lambda: 1.1, goods_list: '1,5'
question6.bundles[4].update_attributes number: 5, lambda: 1.25, goods_list: '2,3'
question6.bundles[5].update_attributes number: 6, lambda: 1.0, goods_list: '2,4'
question6.bundles[6].update_attributes number: 7, lambda: 0.9, goods_list: '2,5'
question6.bundles[7].update_attributes number: 8, lambda: 1.1, goods_list: '3,4'
question6.bundles[8].update_attributes number: 9, lambda: 1.0, goods_list: '3,5'
question6.bundles[9].update_attributes number: 10, lambda: 0.75, goods_list: '4,5'
question6.bundles[10].update_attributes number: 11, lambda: 1.5, goods_list: '1,2,3'
question6.bundles[11].update_attributes number: 12, lambda: 1.1, goods_list: '1,2,4'
question6.bundles[12].update_attributes number: 13, lambda: 1.1, goods_list: '1,2,5'
question6.bundles[13].update_attributes number: 14, lambda: 1.1, goods_list: '1,3,4'
question6.bundles[14].update_attributes number: 15, lambda: 1.2, goods_list: '1,3,5'
question6.bundles[15].update_attributes number: 16, lambda: 0.9, goods_list: '1,4,5'
question6.bundles[16].update_attributes number: 17, lambda: 1.0, goods_list: '2,3,4'
question6.bundles[17].update_attributes number: 18, lambda: 1.0, goods_list: '2,3,5'
question6.bundles[18].update_attributes number: 19, lambda: 0.9, goods_list: '2,4,5'
question6.bundles[19].update_attributes number: 20, lambda: 1.0, goods_list: '3,4,5'
question6.bundles[20].update_attributes number: 21, lambda: 1.1, goods_list: '1,2,3,4'
question6.bundles[21].update_attributes number: 22, lambda: 0.9, goods_list: '2,3,4,5'
question6.bundles[22].update_attributes number: 23, lambda: 1.1, goods_list: '1,2,3,5'
question6.bundles[23].update_attributes number: 24, lambda: 1.0, goods_list: '1,3,4,5'
question6.bundles[24].update_attributes number: 25, lambda: 0.9, goods_list: '1,2,4,5'

question6.combo.update_attributes price: 13, lambda: 1.0


# ====== Insert your pre-question content here ======
question0.update_attributes content: <<-END
<ol>
<li>You will be faced with a decision to purchase a bundle of arbitrary goods
x<sub>1</sub>, x<sub>2</sub> x<sub>3</sub> denoted as Good 1, Good 2, and Good 3.</li>
<br>
<li>Each good has a utility value associated with each good based on the subscript
of the good. (ie. Good 1 (x<sub>1</sub>) has utility value 1, Good 2 (x<sub>2</sub>) has
utility value 2...)</li>
<br>
<li> Purchasing goods together will have substitute and complement effects however. 
It will be stated as follows for goods x<sub>i</sub>, x<sub>j</sub> ; i &ne; j with substitute complement
effect &lambda;<sub>i,j</sub>,
<br>
<br>
<i>"Purchasing goods x<sub>i</sub> and x<sub>j</sub> in an exclusive bundle
makes you value the bundle '&lambda;<sub>i,j</sub>' as much as if you summed the individual
utilities."</i>
<br>
<br>
<li>For a concrete example, the statement for bundle with goods one and two
would be as follows:</li>
<br>
<i>"Purchasing goods one and two in an exclusive bundle makes you value the bundle three quarter 
times as much as if you summed the individual utilities."</i> <br></li><br>
<li>There will be a menu of prices offered for each good. The prices are arranged
randomly.</li><br>
<li>The total utility from the transaction is the utility gained from purchasing
the goods you have chosen minus their posted prices.</li><br>
<li>Your monetary reward is based on the total utility from your final choice.</li>
<br>
<li>This experiment does not count towards your payment, and until you make the utility 
maximizing choice, you will not be able to continue.</li><br>
END

question1.update_attributes content: <<-asdf
<ol>
<li>You will be faced with a decision to purchase a bundle of arbitrary goods
x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, x<sub>4</sub> denoted as Good 1, Good 2, 
Good 3, and Good 4.</li>
<br>
<li>Each good has a utility value associated with each good based on the subscript
of the good. (ie. Good 1 (x<sub>1</sub>) has utility value 1, Good 2 (x<sub>2</sub>) has
utility value 2...)</li>
<br>
<li> Purchasing goods together will have substitute and complement effects however. 
It will be stated as follows for goods x<sub>i</sub>, x<sub>j</sub> ; i &ne; j with substitute complement
effect &lambda;<sub>i,j</sub>,
<br>
<br>
<i>"Purchasing goods x<sub>i</sub> and x<sub>j</sub> in an exclusive bundle
makes you value the bundle '&lambda;<sub>i,j</sub>' as much as if you summed the individual
utilities."</i>
<br>
<br>
<li>For a concrete example, the statement for bundle with goods one and two
would be as follows:</li>
<br>
<i>"Purchasing goods one and two in an exclusive bundle makes you value the bundle three quarter 
times as much as if you summed the individual utilities."</i> <br></li><br>
<li>There will be a menu of prices offered for each good. The prices will be arranged
randomly.</li><br>
<li>The total utility from the transaction is the utility gained from purchasing
the goods you have chosen minus their posted prices.</li><br>
<li>Your monetary reward is based on the total utility from your final choice.</li>
<br>
asdf

question2.update_attributes content: <<-asdf
<ol>
<li>You will be faced with a decision to purchase a bundle of arbitrary goods
x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, x<sub>4</sub>, x<sub>5</sub>, denoted as 
Good 1, Good 2, Good 3, Good 4, and Good 5.</li>
<br>
<li>Each good has a utility value associated with each good based on the subscript
of the good. (ie. Good 1 (x<sub>1</sub>) has utility value 1, Good 2 (x<sub>2</sub>) has
utility value 2...)</li>
<br>
<li> Purchasing goods together will have substitute and complement effects however. 
It will be stated as follows for goods x<sub>i</sub>, x<sub>j</sub> ; i &ne; j with substitute complement
effect &lambda;<sub>i,j</sub>,
<br>
<br>
<i>"Purchasing goods x<sub>i</sub> and x<sub>j</sub> in an exclusive bundle
makes you value the bundle '&lambda;<sub>i,j</sub>' as much as if you summed the individual
utilities."</i>
<br>
<br>
<li>For a concrete example, the statement for bundle with goods two, three, four,
and five would be as follows:</li>
<br>
<i>"Purchasing goods two, three, four, and five in an exclusive bundle makes you value the bundle three quarter 
times as much as if you summed the individual utilities."</i> <br></li><br>
<li>There will be a menu of prices offered for each good. The prices will be arranged
randomly.</li><br>
<li>The total utility from the transaction is the utility gained from purchasing
the goods you have chosen minus their posted prices.</li><br>
<li>Your monetary reward is based on the total utility from your final choice.</li>
<br>
asdf

question3.update_attributes content: <<-asdf
<ol>
<li>You will be faced with a decision to purchase a bundle of arbitrary goods
x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, x<sub>4</sub> denoted as Good 1, Good 2, 
Good 3, and Good 4.</li>
<br>
<li>Each good has a utility value associated with each good based on the subscript
of the good. (ie. Good 1 (x<sub>1</sub>) has utility value 1, Good 2 (x<sub>2</sub>) has
utility value 2...)</li>
<br>
<li> Purchasing goods together will have substitute and complement effects however. 
It will be stated as follows for goods x<sub>i</sub>, x<sub>j</sub> ; i &ne; j with substitute complement
effect &lambda;<sub>i,j</sub>,
<br>
<br>
<i>"Purchasing goods x<sub>i</sub> and x<sub>j</sub> in an exclusive bundle
makes you value the bundle '&lambda;<sub>i,j</sub>' as much as if you summed the individual
utilities."</i>
<br>
<br>
<li>For a concrete example, the statement for bundle with goods one and two
would be as follows:</li>
<br>
<i>"Purchasing goods one and two in an exclusive bundle makes you value the bundle three quarter 
times as much as if you summed the individual utilities."</i> <br></li><br>
<li> In mathematical terms,
<br>
<br>
<i> V(x<sub>1</sub>, x<sub>2</sub>) = .75 [u(x<sub>1</sub>) + u(x<sub>2</sub>)].</i></li>
<br>
<li>There will be a menu of prices offered for each good. The prices will be arranged
randomly.</li><br>
<li>The total utility from the transaction is the utility gained from purchasing
the goods you have chosen minus their posted prices.
<br>
<br>
For example, if you choose to purchase goods 2 and 4...
<br>
<br>
<i>Total Utility = V(x<sub>2</sub>, x<sub>4</sub>) - [P(x<sub>2</sub>, x<sub>4</sub>)].</i></li>
<br>
<li>Your monetary reward is based on the total utility from your final choice.</li>
<br>
asdf

question4.update_attributes content: <<-asdf
<ol>
<li>You will be faced with a decision to purchase a bundle of arbitrary goods
x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, x<sub>4</sub>, x<sub>5</sub> denoted as Good 1, Good 2, 
Good 3, Good 4, and Good 5.</li>
<br>
<li>Each good has a utility value associated with each good based on the subscript
of the good. (ie. Good 1 (x<sub>1</sub>) has utility value 1, Good 2 (x<sub>2</sub>) has
utility value 2...)</li>
<br>
<li> Purchasing goods together will have substitute and complement effects however. 
It will be stated as follows for goods x<sub>i</sub>, x<sub>j</sub> ; i &ne; j with substitute complement
effect &lambda;<sub>i,j</sub>,
<br>
<br>
<i>"Purchasing goods x<sub>i</sub> and x<sub>j</sub> in an exclusive bundle
makes you value the bundle '&lambda;<sub>i,j</sub>' as much as if you summed the individual
utilities."</i>
<br>
<br>
<li>For a concrete example, the statement for bundle with goods one and two
would be as follows:</li>
<br>
<i>"Purchasing goods two, three, four, and five in an exclusive bundle makes you value the bundle three quarter 
times as much as if you summed the individual utilities."</i> <br></li><br>
<li> In mathematical terms,
<br>
<br>
<i> V(x<sub>1</sub>, x<sub>2</sub>) = .75 [u(x<sub>1</sub>) + u(x<sub>2</sub>)].</i></li>
<br>
<li>There will be a menu of prices offered for each good. The prices will be arranged
randomly.</li><br>
<li>The total utility from the transaction is the utility gained from purchasing
the goods you have chosen minus their posted prices.
<br>
<br>
For example, if you choose to purchase goods 2 and 4...
<br>
<br>
<i>Total Utility = V(x<sub>2</sub>, x<sub>4</sub>) - [P(x<sub>2</sub>, x<sub>4</sub>)].</i></li>
<br>
<li>Your monetary reward is based on the total utility from your final choice.</li>
<br>
asdf