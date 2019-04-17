require 'pry'


class CLI

attr_accessor :user, :story, :current_scenario, :energy, :stress, :knowledge

  def initialize
    @prompt = TTY::Prompt.new
  end

  def user_setup(name)
    @user = User.create(name: name)
    @energy = 10
    @story = [
{ #Start day 1
id: 1,
description: "Good morning #{@user.name}. You've just woken up for your first day at Flatiron School.
              Do you want to get up early and have a healthy breakfest or go back to sleep?",
choices: [
  { choice: 2, text: 'Hit snooze.', effect: {energy: -10} },
  { choice: 3, text: 'Get up.'},
],
},
{
id: 2,
description: "You hit snooze a few too many times, and now need to rush into class.",
choices: [
  { choice: 5, text: 'Take the train.'},
  { choice: 5, text: 'Cycle.'},
  { choice: 5, text: 'Run.'},
],
},
{
id: 3,
description: "You wake up nice and early, and enjoy a healthy breakfast! You've got some spare time. How are you getting to school?",
choices: [
  { choice: 5, text: 'Walk.'},
  { choice: 5, text: 'Get the tube.'},
],
},
{
id: 5,
description: 'You arrive at school eager and ready to learn. You notice that everyone else is already seated.
              Looking around people have split into two distinct groups, who do you want to sit with and be stuck with til the end of time?',
choices: [
  { choice: 6, text: 'The nerds?'},
  { choice: 7, text: 'The cool group!'},
],
},
{
id: 6,
description: 'You sit with the nerds (You look like you fit right in), you mingle a bit and get straight to work. You hear labs are coming up soon, do you want a coffee first?',
choices: [
  { choice: 8, text: 'Coffee, coffee, coffee!'},
  { choice: 9, text: 'Straight to the labs!'},
],
},
{
id: 7,
description: 'You sit down with the cool kids, they continue to laugh and joke along with you, you waste a few hours
              screwing around, but make some friends.
              You hear labs are coming up soon, do you want a coffee first?',
choices: [
  { choice: 8, text: 'Coffee, coffee, coffee!'},
  { choice: 9, text: 'Straight to the labs!'},
],
},
{
id: 8,
description: "The coffee here tastes great, better than that utter crap you get from
              (insert popular coffee franchise here)
              Feeling freshly energised you eagerly take on the labs.",
choices: [
  { choice: 9, text: 'Take on the labs!'},
],
},
{
id: 9, #Kind of plain without a battle encounter
description: "You take a look at the labs and are dismayed to see they have released 81 on the first day. How is this fair?",
choices: [
  { choice: 10, text: 'Sack that nonsense off and move onto lunch'},
],
},
{
id: 10,
description: "Rewarding yourself with a nice lunch after all of those labs,
              you've been invited to mediatate or play the campus game Cambio",
choices: [
  { choice: 11, text: 'Meditate'},
  { choice: 11, text: 'Ill try out cambio'},
],
},
{
id: 11,
description: "After you're done you head home and rest",
choices: [
  { choice: 51, text: 'On to day 2'},
],
},
{
id: 51,
description: "OH SHIT! It's 7.30! You're late!!",
choices: [
  { choice: 52, text: 'Oh what the hell. Its too late anyway. Might as well relax
                       and have a boiled egg.'},
  { choice: 53, text: 'Run Forrest, run!'},
],
},
{
id: 52,
description: "Of course you're late and Nico has started his lecture. At the
              speed he goes, you've probably missed a hell of a lot of knowledge.",
choices: [
  { choice: 54, text: 'I can totally sneak in unnoticed...'},
  { choice: 55, text: 'Its too late now. Im going for the buscuit jar.'},
],
},
{
id: 53,
description: "You make it on time but you smell like a Louisiana swamp.",
choices: [
  { choice: 56, text: 'I think WeWork has showers. I can take a quick shower and
                      head to the lecture.'},
  { choice: 57, text: 'I dont smell anything...'},
],
},
{
id: 54,
description: "Kinda hard to sneak in in an office of glass walls but Nico, being
              as awesome as he is, accepts your appology, makes a little joke at
              your expense and tells you to come in.",
choices: [
  { choice: 56, text: 'Great! So tell me, Does Xabi like Metallica or Swift...'},
],
},
{
id: 55,
description: "Ok silliness aside, remember you're here on your own accord so
              lets get serious.",
choices: [
  { choice: 58, text: 'Yes, youre right. Ill catch up on the last 100 labs.'},
  { choice: 58, text: 'Get off my case Mom!'},
],
},
{
id: 56,
description: 'Lecture over, knowledge emparted. Can you feel the power? ',
choices: [
  { choice: 58, text: 'Yes! But now Im starving, time for lunch!'},
  { choice: 58, text: 'I think Ill catch up on some labs.'},
],
},
{
id: 57,
description: "Remember the talk we had on feedback? Well, there's a few angry
              faces around your desk today. Everyones gets together and hold an
              intervention, 'Dude, you smell bad...sorry!''.",
choices: [
  { choice: 72, text: 'I cant bare the shame. Im going home.'},
],
},
{
id: 58,
description: "Lucy has Slacked everyone to remind you that you are presenting
              your first blog post tomorrow, have you done it or even thought about it?",
choices: [
  { choice: 59, text: 'Ummm, Im kinda stuck on ideas. Im gonna go look for Lucy.'},
  { choice: 60, text: 'Actually I have a great idea! Im gonna get working on that now.'},
],
},
{
id: 59,
description: "You go on a quest in search of Lucy, she hasnt been seen in a while...",
choices: [
  { choice: 61, text: 'I think I saw her going towards the pods.'},
],
},
{
id: 60,
description: "Great, so you get working on that, and dont forget, when it comes
              to memes, more is more!",
choices: [
  { choice: 59, text: 'Ok shhhh , youre disracting me!'},
],
},
{
id: 61,
description: "You look inside the pods but all the doors are open and no ones
              inside, excpet....the one at the back seems to be glowing and the
              door is closed.",
choices: [
  { choice: 62, text: 'Woah...Im kinda scared but lets check it out.'},
  { choice: 62, text: 'Oh heell no! Ill just wait here, uh, till shes done...I guess.'},
],
},
{
id: 62,
description: "You tiptoe towards the pod, flinching as it sparks and glows violently.",
choices: [
  { choice: 63, text: 'Bill? Ted? Lucy??'},
  { choice: 63, text: 'I am over loaded with 80s film refrences! Maybe someones
                      just watching a movie in there?'},
],
},
{
id: 63,
description: "You grab the handle but its locked and theres currents of electricity
              bolting around the your hand.",
choices: [
  { choice: 64, text: 'Pull harder! I HAVE TO KNOW WHATS INSIDE!'},
  { choice: 65, text: 'IM COMING TO SAVE YOU LUCY!!'},
],
},
{
id: 64,
description: "You pull and pull until it breaks open with a bright light washing
              over the whole floor.",
choices: [
  { choice: 66, text: 'What is happening?! Oh hey Steve Jobs, what what!?'},
],
},
{
id: 65,
description: "You run back, build momentum and run towards the door but just as
              you're about to smash into it, it opens and a bright light washes over the whole floor.",
choices: [
  { choice: 66, text: 'Wooah! Flatiron coffee is strong as hell!'},
],
},
{
id: 66,
description: "You fly or fall (You're not really sure which way up you are) through
              the void until you reach a sudden stop. You're pushed upright and just
              float calmly infront of a large seethrough screen with a few lines of
              glowing code. A voice declares, 'This, is your first code challenge.
              Should you wish to accept, you will be asked to solve one of two questions:'",
choices: [
  { choice: 67, text: 'Say Hello to the world.'},
  { choice: 68, text: 'What is the meaning of life?'},
],
},
{
id: 67,
description: "Remember, the fate of Lucy rests in your hands. GOOD LUCK, DUDE!",
choices: [
  { choice: 70, text: 'puts "Hello World!"'},
  { choice: 69, text: 'def say_hello
                          puts "Hello World!"
                       end'},
  { choice: 70, text: 'def say_hello
                          "Hello World!"
                       end'},
],
},
{
id: 68,
description: "Psst. Ask him if you can use Google.",
choices: [
  { choice: 70, text: 'def the_meaning_of_life
                          if meaning === love && me === single
                            puts "Lonelyyy, I am so lonelyyy."
                          elsif
                            puts "Im killin it!"
                          else
                            self.end_it_all
                       end'},
  { choice: 70, text: 'def the_meaning_of_life
                          puts "To be or not to be."
                       end'},
  { choice: 69, text: 'DOGS!'},
],
},
{
id: 69,
description: "GLING! The screen begins to glow and you hear the voice say, 'YOU
              have passed the code challenge. Lucy awaits on the otherside.'.
              Suddenly, you begin to fall again utnil you drop back into the pod,
              excpet this time its empty and calm. The lights are on and your
              laptop is infront of you. You then hear Lucy call you.",
choices: [
  { choice: 71, text: '"Im coming!!"'},
  { choice: 72, text: 'I am exhausted. Im off. Ciao!'},
],
},
{
id: 70,
description: "Oh MAN! What have you done! The screen is now glowing red and the
              voice sounds angry, 'FOOL! You have failed. I hereby banish you to
              the online bootcamp!'. ",
choices: [
  { choice: 300, text: 'GAME OVER'},
],
},
{
id: 71,
description: "You get Lucys help and all is well in the world of Flatiron. What
              do you want to do for the rest of your evening?",
choices: [
  { choice: 72, text: 'I think Ill work on the blog and head home.', effect: {energy: -20} },
  { choice: 72, text: 'I think Ill head home. Im gonna have some crazy ass dreams tonight!'},
],
},
{
id: 72,
description: "Home sweet home. You get into bed and passout instantly...enjoy those
              coding dreams mwahahaha!",
choices: [
  { choice: 100, text: 'Tomorrow, tomorrow, I love yaa tomorrow!!'},
]
},
{ #Start day 3
id: 100,
description: "You wake up refreshed and head into school. You eagerly get to work, its going smoothly. You notice someone keeps playing youtube videos out loud. How do you want to adress this?",
choices: [
  { choice: 101, text: 'Ignore them.'},
  { choice: 102, text: 'Give them feedback.'},
],
},
{
id: 101,
description: "They continue to be obnoxious and annoying. Disrupting everyone. Maybe you should have given feedback",
choices: [
  { choice: 105, text: 'Continue'},
],
},
{
id: 102,
description: "You wait for a good oppurtunity to give feedback, they're not being very receptive. Do you continue being positive or rip into them?",
choices: [
  { choice: 103, text: 'Talk to them sternly'},
  { choice: 104, text: 'Be proffesional'},
],
},
{
id: 103,
description: "You get angry and tell them straight how they're acting, getting your point across",
choices: [
  { choice: 105, text: 'Continue'},
],
},
{
id: 104,
description: "You keep your cool and explain rationally, eventually they get the point",
choices: [
  { choice: 105, text: 'Continue'},
],
},
{
id: 105,
description: "They've finally stopped and you get back to work. You get to a lab on ActiveRecord and get stuck. Which resource do you use to solve this?",
choices: [
  { choice: 106, text: "Google the issue"},
  { choice: 107, text: "Ask a TCF for help and guidance "},
  { choice: 108, text: "Search Stack Overflow"},
],
},
{
id: 106,
description: "You google the question, there isnt much help on here. You even go to the baren wastelands of page 2 of google. Nothing. Now what?",
choices: [
  { choice: 108 , text: 'Stack Overflow'},
  { choice: 107 , text: 'Ask a TCF'},
],
},
{
id: 107,
description: "You ask a TCF for help with the lab, they explain it to you. Doing most of it for you. Win!",
choices: [
  { choice: 109, text: 'Continue'},
],
},
{
id: 108,
description: "You search around Stack Overflow, you notice other people have asked the question,
              got no reply and then edited 'Problem solved' without saying how, typical! What do you do now?",
choices: [
  { choice: 106, text: 'Google it'},
  { choice: 107, text: 'Ask a TCF'},
],
},
{
id: 109,
description: "You continue to study throughout the day. Not noticing the time, its now 6:30 and youve been invited to get a beer downstairs.
              Do you go and socialize, go home, or stay and work for another hour?",
choices: [
  { choice: 110, text: 'Beer obviously'},
  { choice: 111, text: 'Home time'},
  { choice: 112, text: 'Id rather work on my own'},
],
},
{
id: 110,
description: "You have a few beers in the lobby, and you enjoy socializing.
              Your classmates are pretty cool. Stay for more?",
choices: [
  { choice: 113, text: 'Stay for more'},
  { choice: 111, text: 'Head home'},
],
},
{
id: 111,
description: "You head home after a productive day and get some sleep",
choices: [
  { choice: 150, text: 'On to day 4'},
],
},
{
id: 112,
description: "You stay for a bit longer, keeping on top of labs. Then head home",
choices: [
  { choice: 150, text: 'On to day 4'},
],
},
{
id: 113,
description: "You have a few more drinks, you get talking to some people in the mod above you, who tell
              you some invaluable information about the upcoming code challenge. You feel pretty tipsy
              at this point, and it would be unwise to stay for more. Stay for more drinks?",
choices: [
  { choice: 114, text: 'Even more drinks'},
  { choice: 150, text: "Im good, i'll head home"},
],
},
{
id: 114,
description: "You've had way too much. You make a complete mess of yourself, throwing up in the bathroom.
              Security escorts you out saying 'You dont have to go home, but you cant stay here'. You go home anyway.",
choices: [
  { choice: 120, text: "You've been invited to a meeting tomorrow"},
],
},
{
id: 120,
description: "You nervously sit down in the meeting, they tell you that based on your behaviour last night
              You have been banished to the online course!",
choices: [
  { choice: 300, text: "GAME OVER"},
],
},
{ #Start day 4
id: 150,
description: "After unpacking your bag and quickly checking your slack & email, you see a message
  from Ben informing you that there is breakfast in the lobby. Do you...?",
choices: [
  { choice: 151, text: 'Go down to the lobby with your friend'},
  { choice: 152, text: 'Start work'}
],
},
{
id: 151,
description: "You arrive in the Lobby to the sight of many little pots on the counter.
  You take a pot of oats and a yoghurt and are about to turn towards the lifts when Laura asks if you want to get a coffee from the barista.",
choices: [
  { choice: 155, text: 'Stay for coffee with Laura'},
  { choice: 152, text: 'Head back upstairs with your breakfast'}
],
},
{
id: 152,
description: "Knowing that you have a lecture on a new topic coming up, you sit at your desk and think about where to start work.
  You have about 30 incomplete labs from previous topics but don't think you should move on yet. There is a message to focus on being ready for the lecture.",
choices: [
  { choice: 154, text: 'Catch up on previous topics'},
  { choice: 153, text: 'Familiarize yourself with new material'},
],
},
{
id: 153,
description: "Lecture scenario A When the time comes, you feel at ease during the lecture and are happily asking questions and moving along",
choices: [
  { choice: 156, text: 'continue'},
],
},
{
id: 154,
description: "Lecture scenario B You sit down for the lecture and from the first moment you struggle to follow the logic, you don't even know where to begin with asking questions.
  The others seem to be engaging and you feel overwhelmed",
choices: [
  { choice: 156, text: 'continue'},
],
},
{
id: 155,
description: "Lecture scenario C You only just make it to the lecture, clutching your barista coffee. Nico might as well be speaking a different language.",
choices: [
  { choice: 156, text: 'continue'},
],
},
{
id: 300,
description: "input end of game text here",
choices: [
  { choice: 156, text: 'End of game'},
],
},
]
    @current_scenario = @story[0]
  end

  def create_user
    name = @prompt.ask("What's your name?")
    user_setup(name)
  end

  def choose_scenario
    choice = @prompt.select("What would you like to do?:")
    @current_scenario = story.find { |scenario| scenario[:id] == choice }
  end

  def display_current_scenario
    puts "                              "
    puts @current_scenario[:description]

    # puts @current_scenario[:choices],
    choice = @prompt.select("****") do |menu|
      @current_scenario[:choices].each do |choice|
        menu.choice name: choice[:text], value: choice
      end
    end
    next_scenario_id = choice[:choice]
    # effects = choice[:effects]
    # effects.each do |key, value|
    #   @user.key += value
    #  end
    # apply these effects to the @user

    @current_scenario = @story.find { |scenario| scenario[:id] == next_scenario_id }
    display_current_scenario
  end

  def run
    create_user
    display_current_scenario
  end
end
