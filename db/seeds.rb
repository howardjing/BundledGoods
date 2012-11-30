# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ====== Insert your pre-question content here ======
demo_instructions = <<-END
<ol>
<li>You will be faced with a decision to purchase a bundle of arbitrary goods
x<sub>1</sub>, x<sub>2</sub> x<sub>3</sub> denoted as Good 1, Good 2, and Good 3.</li>
<br>
<li>There is a menu of values for goods that are given to you. 
	</li>
<br>
<li> Purchasing goods together will have a Bundle Effect however. 
It will be stated as follows for goods x<sub>i</sub>, x<sub>j</sub> ; i &ne; j with bundle
effect &lambda;<sub>i,j</sub>,
<br>
<br>
<i>"Purchasing goods x<sub>i</sub> and x<sub>j</sub> in an exclusive bundle
makes you value the bundle '&plusmn; &lambda;<sub>i,j</sub>' more than if you summed the individual
utilities."</i>
<br>
<br>
<li>For a concrete example, the statement for bundle with goods one and two
would be as follows:</li>
<br>
<i>"Purchasing goods one and two in an exclusive bundle makes you value the bundle 1 
more than if you summed the individual utilities."</i> <br></li><br>
<li>The total utility from the transaction is the Value gained from purchasing
the goods you have chosen adding the respective Bundle Effect. <B>THE FINAL VALUE YOU CALCULATE 
IS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>
<li>Your monetary reward is based on the total utility from your final choice.</li>
<br>
<li>This experiment does not count towards your payment, and until you make the utility 
maximizing choice, you will not be able to continue.</li><br>
END
Instruction.create!(number: 0, content: demo_instructions)

instructions1 = <<-asdf
<ol>
<li>You will be faced with a decision to purchase a bundle of arbitrary goods
x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, x<sub>4</sub> denoted as Good 1, Good 2, 
Good 3, and Good 4.</li>
<br>
<li>There is a menu of values for goods that are given to you.</li>
<br>
<li>The value of the goods in this experiment are equally distributed between 0 and 2. This means each good 
will have a equal chance of being assigned a value between the given range.</li>
<br>
<li> Purchasing goods together will have a Bundle Effect however. 
It will be stated as follows for goods x<sub>i</sub>, x<sub>j</sub> ; i &ne; j with bundle
effect &lambda;<sub>i,j</sub>,
<br>
<br>
<i>"Purchasing goods x<sub>i</sub> and x<sub>j</sub> in an exclusive bundle
makes you value the bundle '&plusmn; &lambda;<sub>i,j</sub>' more than if you summed the individual
utilities."</i>
<br>
<br>
<li>For a concrete example, the statement for bundle with goods one and two
would be as follows:</li>
<br>
<i>"Purchasing goods one and two in an exclusive bundle makes you value the bundle 1 
more than if you summed the individual utilities."</i> <br></li><br>
<li>Bundle Effects for each combination of goods will be equally distributed between -3 and 3. 
This means each bundle will have an equal chance of being assigned a value between the given range.
<br>
<li>The total utility from the transaction is the Value gained from purchasing
the goods you have chosen adding the respective Bundle Effect. <B>THE FINAL VALUE YOU CALCULATE 
IS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>
<li>Your monetary reward is based on the total utility from your final choice.</li>
<br>
<li>There is a time limit of 15 minutes for this experiment. The final choice you have 
selected when the given timer runs out will be your final choice for the experiment.</li>
<br>
asdf
Instruction.create!(number: 1, content: instructions1)


instructions2 = <<-asdf
<ol>
<li>You will be faced with a decision to purchase a bundle of arbitrary goods
x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, x<sub>4</sub>, x<sub>5</sub>, denoted as 
Good 1, Good 2, Good 3, Good 4, and Good 5.</li>
<br>
<li>There is a menu of values for goods that are given to you.
	</li>
<br>
<li>The value of the goods in this experiment are equally distributed between 0 and 2. This means each good 
will have a equal chance of being assigned a value between the given range.</li>
<br>
<li> Purchasing goods together will have Bundle effects however. 
It will be stated as follows for goods x<sub>i</sub>, x<sub>j</sub> ; i &ne; j with bundle
effect &lambda;<sub>i,j</sub>,
<br>
<br>
<i>"Purchasing goods x<sub>i</sub> and x<sub>j</sub> in an exclusive bundle
makes you value the bundle '&plusmn; &lambda;<sub>i,j</sub>' more than if you summed the individual
utilities."</i>
<br>
<br>
<li>For a concrete example, the statement for bundle with goods two, three, four,
and five would be as follows:</li>
<br>
<i>"Purchasing goods two, three, four, and five in an exclusive bundle makes you value the bundle - 1.0 
less than if you summed the individual utilities."</i> <br></li><br>
<br>
<li>The total utility from the transaction is the value gained from purchasing
the goods you have chosen adding the respective Bundle Effect. <B>THE FINAL VALUE YOU CALCULATE 
IS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>
<li>Bundle Effects for each combination of goods will be equally distributed between -3 and 3. 
This means each bundle will have an equal chance of being assigned a value between the given range.
<br>
<li>Your monetary reward is based on the total utility from your final choice.</li>
<br>
<li>There is a time limit of 20 minutes for this experiment. The final choice you have 
selected when the given timer runs out will be your final choice for the experiment.</li>
<br>
asdf
Instruction.create!(number: 2, content: instructions2)

instructions3 = <<-asdf
<ol>
<li>You will be faced with a decision to purchase a bundle of arbitrary goods
x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, x<sub>4</sub> denoted as Good 1, Good 2, 
Good 3, and Good 4.</li>
<br>
<li>There is a menu of values for goods that are given to you.
	</li>
<br>
<li>The value of the goods in this experiment are equally distributed between 0 and 2. This means each good 
will have a equal chance of being assigned a value between the given range.</li>
<br>
<li> Purchasing goods together will have a Bundle Effect however. 
It will be stated as follows for goods x<sub>i</sub>, x<sub>j</sub> ; i &ne; j with bundle
effect &lambda;<sub>i,j</sub>,
<br>
<br>
<i>"Purchasing goods x<sub>i</sub> and x<sub>j</sub> in an exclusive bundle
makes you value the bundle '&plusmn; &lambda;<sub>i,j</sub>' more than if you summed the individual
utilities."</i>
<br>
<br>
<li>For a concrete example, the statement for bundle with goods one and two
would be as follows:</li>
<br>
<i>"Purchasing goods one and two in an exclusive bundle makes you value the bundle 1 
more than if you summed the individual utilities."</i> <br></li><br>
<li> In mathematical terms,
<br>
<br>
<i> V(x<sub>1</sub>, x<sub>2</sub>) = [u(x<sub>1</sub>) + u(x<sub>2</sub>)] 1.</i></li>
<br>
<li>For a concrete example, the statement for bundle with goods one and two
would be as follows:</li>
<br>
<i>"Purchasing goods one and two in an exclusive bundle makes you value the bundle 1 
more than if you summed the individual utilities."</i> <br></li><br>
<li>Bundle Effects for each combination of goods will be equally distributed between -3 and 3. 
This means each bundle will have an equal chance of being assigned a value between the given range.
<br>
<li>The total utility from the transaction is the Value gained from purchasing
the goods you have chosen adding the respective Bundle Effect. <B>THE FINAL VALUE YOU CALCULATE 
IS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>
<li>There is a time limit of 15 minutes for this experiment. The final choice you have 
selected when the given timer runs out will be your final choice for the experiment.</li>
<br>
asdf
Instruction.create!(number: 3, content: instructions3)

instructions4 = <<-asdf
<ol>
<li>You will be faced with a decision to purchase a bundle of arbitrary goods
x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, x<sub>4</sub>, x<sub>5</sub>, denoted as 
Good 1, Good 2, Good 3, Good 4, and Good 5.</li>
<br>
<li>There is a menu of values for goods that are given to you.
	</li>
<br>
<li>The value of the goods in this experiment are equally distributed between 0 and 2. This means each good 
will have a equal chance of being assigned a value between the given range.</li>
<br>
<li> Purchasing goods together will have Bundle effects however. 
It will be stated as follows for goods x<sub>i</sub>, x<sub>j</sub> ; i &ne; j with bundle
effect &lambda;<sub>i,j</sub>,
<br>
<br>
<i>"Purchasing goods x<sub>i</sub> and x<sub>j</sub> in an exclusive bundle
makes you value the bundle '&plusmn; &lambda;<sub>i,j</sub>' more than if you summed the individual
utilities."</i>
<br>
<br>
<li>For a concrete example, the statement for bundle with goods two, three, four, and five 
would be as follows:</li>
<br>
<i>"Purchasing goods two, three, four, and five in an exclusive bundle makes you value the bundle - 1.0 
less than if you summed the individual utilities."</i> <br></li><br>
<li> In mathematical terms,
<br>
<br>
<i> V(x<sub>2</sub>, x<sub>3</sub>, x<sub>4</sub>, x<sub>5</sub>) = [u(x<sub>2</sub>) + u(x<sub>3</sub>) + u(x<sub>4</sub>) + u(x<sub>5</sub>)] - 1.0.</i></li>
<br>
<br>
<li>The total utility from the transaction is the Value gained from purchasing
the goods you have chosen adding the respective Bundle Effect. <B>THE FINAL VALUE YOU CALCULATE 
IS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>
<li>Bundle Effects for each combination of goods will be equally distributed between -3 and 3. 
This means each bundle will have an equal chance of being assigned a value between the given range.
<br>
<br>
<li>Your monetary reward is based on the total utility from your final choice.</li>
<br>
<li>There is a time limit of 20 minutes for this experiment. The final choice you have 
selected when the given timer runs out will be your final choice for the experiment.</li>
<br>
asdf
Instruction.create!(number: 4, content: instructions4)

instructions5 = <<-asdf
<ol>
<li>You will be faced with a decision to purchase a bundle of arbitrary goods
x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, x<sub>4</sub> denoted as Good 1, Good 2, 
Good 3, and Good 4.</li>
<br>
<li>There is a menu of values for goods that are given to you.
	</li>
<br>
<li>The value of the goods in this experiment are equally distributed between 0 and 2. This means each good 
will have a equal chance of being assigned a value between the given range.</li>
<br>
<li> Purchasing goods together will have a Bundle Effect however. 
It will be stated as follows for goods x<sub>i</sub>, x<sub>j</sub> ; i &ne; j with bundle
effect &lambda;<sub>i,j</sub>,
<br>
<br>
<i>"Purchasing goods x<sub>i</sub> and x<sub>j</sub> in an exclusive bundle
makes you value the bundle '&plusmn; &lambda;<sub>i,j</sub>' more than if you summed the individual
utilities."</i>
<br>
<br>
<li>For a concrete example, the statement for bundle with goods one and two
would be as follows:</li>
<br>
<i>"Purchasing goods one and two in an exclusive bundle makes you value the bundle 1 
more than if you summed the individual utilities."</i> <br></li><br>
<li>Bundle Effects for each combination of goods will be equally distributed between -3 and 3. 
This means each bundle will have an equal chance of being assigned a value between the given range.
<br>
<li>The total utility from the transaction is the Value gained from purchasing
the goods you have chosen adding the respective Bundle Effect. <B>THE FINAL VALUE YOU CALCULATE 
IS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>
<li>Your monetary reward is based on the total utility from your final choice.</li>
<br>
<li>In this experiment, a time picked at random between 1 and 900 seconds, or 15 minutes, which is described by 
  the graph below, will be randomly selected. Whatever option you have selected at that time 
  will be your final choice for that particular experiment. Therefore, it is in your best interest 
  to "choose as you go" in the sense that, if you prefer a particular option more to the one you 
  have selected, to change your selection. This experiment will be different from the other 
  experiments as your final choice is not necessarily the choice you selected when you click "finish", 
  but the choice that you have selected at the randomly determined time. </li>
  <br>
<li>The time that is selected will be determined by drawing from a random integer number between
  1 and 900 seconds (15 minutes) from the given distribution pictured below. The x axis is the possible times 
  with the probability of the time happening on appearing on the y axis. For example, there is a
  approximately a 5 percent chance that 1 minutes, or sixty seconds, will be the time selected and approximately a 6.5 percent chance that 5 minutes, 300 seconds, will be the 
  time selected. Below is the graph of the probability distribution for Experiment 5.</li>
<br>
<img src="http://i.imgur.com/NwMX5.png">
asdf
Instruction.create!(number: 5, content: instructions5)

instructions6 = <<-asdf
<ol>
<li>You will be faced with a decision to purchase a bundle of arbitrary goods
x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, x<sub>4</sub>, x<sub>5</sub>, denoted as 
Good 1, Good 2, Good 3, Good 4, and Good 5.</li>
<br>
<li>There is a menu of values for goods that are given to you.
	</li>
<br>
<li>The value of the goods in this experiment are equally distributed between 0 and 2. This means each good 
will have a equal chance of being assigned a value between the given range.</li>
<br>
<li> Purchasing goods together will have Bundle effects however. 
It will be stated as follows for goods x<sub>i</sub>, x<sub>j</sub> ; i &ne; j with bundle
effect &lambda;<sub>i,j</sub>,
<br>
<br>
<i>"Purchasing goods x<sub>i</sub> and x<sub>j</sub> in an exclusive bundle
makes you value the bundle '&plusmn; &lambda;<sub>i,j</sub>' more than if you summed the individual
utilities."</i>
<br>
<br>
<li>For a concrete example, the statement for bundle with goods two, three, four,
and five would be as follows:</li>
<br>
<i>"Purchasing goods two, three, four, and five in an exclusive bundle makes you value the bundle - 1.0 
less than if you summed the individual utilities."</i> <br></li><br>
<br>
<li>Bundle Effects for each combination of goods will be equally distributed between -3 and 3. 
This means each bundle will have an equal chance of being assigned a value between the given range.
<br>
<li>The total utility from the transaction is the value gained from purchasing
the goods you have chosen adding the respective Bundle Effect. <B>THE FINAL VALUE YOU CALCULATE 
IS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>
<li>Your monetary reward is based on the total utility from your final choice.</li>
<br>
<li>In this experiment, a time picked at random between 1 and t seconds, which is described by 
  the graph below, will be randomly selected. Whatever option you have selected at that time 
  will be your final choice for that particular experiment. Therefore, it is in your best interest 
  to "choose as you go" in the sense that, if you prefer a particular option more to the one you 
  have selected, to change your selection. This experiment will be different from the other 
  experiments as your final choice is not necessarily the choice you selected when you click "finish", 
  but the choice that you have selected at the randomly determined time. </li>
<br>
<li>The time that is selected will be determined by drawing from a random integer number between
  1 and 1200 seconds (20 minutes) from the given distribution pictured below. The x axis is the possible times 
  with the probability of the time happening on appearing on the y axis. For example, there is a
  approximately a 7 percent chance that 
  2 minutes, or 120 seconds, will be selected and approximately a 4 percent chance that 9 minutes, 
  or 360 seconds, will be selected. Below is the graph of the probability distribution for Experiment 6.</li>
<br>
<img src="http://i.imgur.com/IXVc0.png">
asdf
Instruction.create!(number: 6, content: instructions6)
