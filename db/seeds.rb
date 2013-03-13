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
<br>
<br>
<li>For a concrete example, a bundle effect for a statement containing goods one and two
would be as follows:</li>
<br>
<i>"Purchasing goods [1,2] gives a bundle effect of + 1."</i> <br></li><br>
<li>The final value gained from purchasing
the goods you have chosen is the sum of their values added with the respective Bundle Effect. <B>THE FINAL VALUE YOU CALCULATE 
IS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>
<br>
<li>This experiment does not count towards your payment.</li><br>
END
Instruction.create!(number: 0, content: demo_instructions)

instructions1 = <<-asdf
<ol>
<li>You will be faced with a decision to purchase a bundle of arbitrary goods
x<sub>1</sub>, x<sub>2</sub>, and x<sub>3</sub> denoted as Good 1, Good 2, and 
Good 3.</li>
<br>
<li>There is a menu of values for goods that are given to you.</li>
<br>
<li>The value of the goods in this experiment are equally distributed between 0 and 2. This means each good 
will have a equal chance of being assigned a value between the given range.</li>
<br>
<li> Purchasing goods together will have a Bundle Effect however. 
For a concrete example, the bundle effect for a statement containing goods one and two
would be as follows:</li>
<br>
<i>"Purchasing goods [1,2] gives a bundle effect of + 1."</i> <br></li><br>
<li>Bundle Effects for each combination of goods will be equally distributed between -4 and 4. 
This means each bundle will have an equal chance of being assigned a value between the given range.
<br>
<li><B>THE FINAL VALUE YOU CALCULATE 
IS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>
<li>Your monetary reward is based on the total value from your final choice.</li>
<br>
<li>There is a time limit of 5 minutes for this experiment. The final choice you have 
selected when the given timer runs out will be your final choice for the experiment.</li>
<br>
asdf
Instruction.create!(number: 1, content: instructions1)


instructions2 = <<-asdf
<ol>
<li>You will be faced with a decision to purchase a bundle of arbitrary goods
x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, and x<sub>4</sub> denoted as 
Good 1, Good 2, Good 3, and Good 4.</li>
<br>
<li>There is a menu of values for goods that are given to you.
	</li>
<br>
<li>The value of the goods in this experiment are equally distributed between 0 and 2. This means each good 
will have a equal chance of being assigned a value between the given range.</li>
<br>
<li> Purchasing goods together will have a Bundle Effect however. 
For a concrete example, the bundle effect for a statement containing goods one and two
would be as follows:</li>
<br>
<i>"Purchasing goods [1,2] gives a bundle effect of + 1."</i> <br></li><br>
<br>
<li><B>THE FINAL VALUE YOU CALCULATE 
IS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>
<li>Bundle Effects for each combination of goods will be equally distributed between -4 and 4. 
This means each bundle will have an equal chance of being assigned a value between the given range.
<br>
<li>Your monetary reward is based on the total value from your final choice.</li>
<br>
<li>There is a time limit of 5 minutes for this experiment. The final choice you have 
selected when the given timer runs out will be your final choice for the experiment.</li>
<br>
asdf
Instruction.create!(number: 2, content: instructions2)

instructions3 = <<-asdf
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
For a concrete example, the bundle effect for a statement containing goods two, three, four,
and five would be as follows:</li>
<br>
<i>"Purchasing goods two, three, four, and five gives a bundle effect of - 1.0."</i> <br></li><br>
<br>
<li><B>THE FINAL VALUE YOU CALCULATE 
IS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>
<li>Bundle Effects for each combination of goods will be equally distributed between -4 and 4. 
This means each bundle will have an equal chance of being assigned a value between the given range.
<br>
<li>Your monetary reward is based on the total value from your final choice.</li>
<br>
<li>There is a time limit of 5 minutes for this experiment. The final choice you have 
selected when the given timer runs out will be your final choice for the experiment.</li>
<br>
asdf
Instruction.create!(number: 3, content: instructions3)

instructions4 = <<-asdf
<ol>
<li>You will be faced with a decision to purchase a bundle of arbitrary goods
x<sub>1</sub>, x<sub>2</sub>, and x<sub>3</sub> denoted as Good 1, Good 2, and 
Good 3.</li>
<br>
<li>There is a menu of values for goods that are given to you.
	</li>
<br>
<li>The value of the goods in this experiment are equally distributed between 0 and 2. This means each good 
will have a equal chance of being assigned a value between the given range.</li>
<br>
<li> Purchasing goods together will have a Bundle Effect however. 
For a concrete example, the bundle effect for a statement containing goods one and two
would be as follows:</li>
<br>
<i>"Purchasing goods [1,2] gives a bundle effect of + 1."</i> <br></li><br>
<li>Bundle Effects for each combination of goods will be equally distributed between -4 and 4. 
This means each bundle will have an equal chance of being assigned a value between the given range.
<br>
<li><B>THE FINAL VALUE YOU CALCULATE 
IS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>
<li>Your monetary reward is based on the total value from your final choice.</li>
<br>
<li>In this experiment, a time picked at random between 1 and 300 seconds, or 5 minutes, which is described by 
  the graph below, will be randomly selected. Whatever option you have selected at that time 
  will be your final choice for that particular experiment. Therefore, it is in your best interest 
  to "choose as you go" in the sense that, if you prefer a particular option more to the one you 
  have selected, to change your selection. This experiment will be different from the other 
  experiments as your final choice is not necessarily the choice you selected when you click "finish", 
  but the choice that you have selected at the randomly determined time. </li>
  <br>
<li>The time that is selected will be determined by drawing from a random integer number between
  1 and 300 seconds (5 minutes) from the given distribution pictured below. The x axis is the possible times 
  with the probability of the time happening on appearing on the y axis. For example, there is a
  approximately a 7 percent chance that 35 seconds, will be the time selected and approximately a 5 percent chance that 125 seconds will be the 
  time selected. Below is the graph of the probability distribution for Experiment 4.</li>
<br>
<img src="http://i.imgur.com/9VTK4cE.png">
asdf
Instruction.create!(number: 4, content: instructions4)

instructions5 = <<-asdf
<ol>
<li>You will be faced with a decision to purchase a bundle of arbitrary goods
x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, and x<sub>4</sub> denoted as 
Good 1, Good 2, Good 3, and Good 4.</li>
<br>
<li>There is a menu of values for goods that are given to you.
	</li>
<br>
<li>The value of the goods in this experiment are equally distributed between 0 and 2. This means each good 
will have a equal chance of being assigned a value between the given range.</li>
<br>
<li> Purchasing goods together will have a Bundle Effect however. 
For a concrete example, the bundle effect for a statement containing goods one and two
would be as follows:</li>
<br>
<i>"Purchasing goods [1,2] gives a bundle effect of + 1."</i> <br></li><br>
<br>
<li><B>THE FINAL VALUE YOU CALCULATE 
IS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>
<li>Bundle Effects for each combination of goods will be equally distributed between -4 and 4. 
This means each bundle will have an equal chance of being assigned a value between the given range.
<br>
<li>Your monetary reward is based on the total value from your final choice.</li>
<br>
<li>In this experiment, a time picked at random between 1 and 300 seconds, or 5 minutes, which is described by 
  the graph below, will be randomly selected. Whatever option you have selected at that time 
  will be your final choice for that particular experiment. Therefore, it is in your best interest 
  to "choose as you go" in the sense that, if you prefer a particular option more to the one you 
  have selected, to change your selection. This experiment will be different from the other 
  experiments as your final choice is not necessarily the choice you selected when you click "finish", 
  but the choice that you have selected at the randomly determined time. </li>
  <br>
<li>The time that is selected will be determined by drawing from a random integer number between
  1 and 300 seconds (5 minutes) from the given distribution pictured below. The x axis is the possible times 
  with the probability of the time happening on appearing on the y axis. For example, there is a
  approximately a 7 percent chance that 35 seconds, will be the time selected and approximately a 5 percent chance that 125 seconds will be the 
  time selected. Below is the graph of the probability distribution for Experiment 4.</li>
<br>
<img src="http://i.imgur.com/9VTK4cE.png">
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
For a concrete example, the bundle effect for a statement containing goods two, three, four,
and five would be as follows:</li>
<br>
<i>"Purchasing goods two, three, four, and five gives a bundle effect of - 1.0."</i> <br></li><br>
<br>
<li><B>THE FINAL VALUE YOU CALCULATE 
IS THE MONETARY REWARD YOU RECEIVE FOR THIS ROUND.</B></li><br>
<li>Bundle Effects for each combination of goods will be equally distributed between -4 and 4. 
This means each bundle will have an equal chance of being assigned a value between the given range.
<br>
<li>Your monetary reward is based on the total value from your final choice.</li>
<br>
<li>In this experiment, a time picked at random between 1 and 300 seconds, or 5 minutes, which is described by 
  the graph below, will be randomly selected. Whatever option you have selected at that time 
  will be your final choice for that particular experiment. Therefore, it is in your best interest 
  to "choose as you go" in the sense that, if you prefer a particular option more to the one you 
  have selected, to change your selection. This experiment will be different from the other 
  experiments as your final choice is not necessarily the choice you selected when you click "finish", 
  but the choice that you have selected at the randomly determined time. </li>
  <br>
<li>The time that is selected will be determined by drawing from a random integer number between
  1 and 300 seconds (5 minutes) from the given distribution pictured below. The x axis is the possible times 
  with the probability of the time happening on appearing on the y axis. For example, there is a
  approximately a 7 percent chance that 35 seconds, will be the time selected and approximately a 5 percent chance that 125 seconds will be the 
  time selected. Below is the graph of the probability distribution for Experiment 4.</li>
<br>
<img src="http://i.imgur.com/9VTK4cE.png">
asdf
Instruction.create!(number: 6, content: instructions6)
