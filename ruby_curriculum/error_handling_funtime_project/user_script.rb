require_relative 'super_useful'

# not sure why this was here since the specs for this project did not include 
# instructions on what to do with this section -> fixed it anyways!
# problem was that the function takes in a integer that is a string and converts it to an integer
puts "'five' == #{convert_to_int('5')}"

feed_me_a_fruit

sam = BestFriend.new('Sam', 5, 'play some video games')

sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet
