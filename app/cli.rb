require 'pry'


class CLI

attr_accessor :user, :story, :current_scenario

  def initialize
    @prompt = TTY::Prompt.new
  end

  def user_setup(name)
    @user = User.create(name: name)
    @energy = 10
    # @name = 'bob'
    @story = [
      { #Start day 1
        id: 1,
        description: "Good morning #{@user.name}. You've just woken up for your first day at flatiron school. Do you want to get up early and have a healthy breakfest or go back to sleep?",
        choices: [
          { choice: 2, text: 'Hit snooze.', effect: {energy: -10} },
          { choice: 3, text: 'Get up.'},
        ],
      },
      {
        id: 2,
        description: "You hit snooze a few too many times, and now need to rush into class",
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
          { choice: 5, text: 'Walk'},
          { choice: 5, text: 'Get the tube.'},
        ],
      },
      {
        id: 5,
        description: 'You arrive at school eager and ready to learn. You notice that everyone else is seated. Looking around people have split into two distinct groups, who do you want to sit with?',
        choices: [
          { choice: 6, text: 'The nerds?'},
          { choice: 7, text: 'The cool group!'},
        ],
      },
      {
        id: 6,
        description: 'You sit with the nerds (You look like you fit right in), you mingle a bit and get straight to work. You hear labs are coming up soon, do you want a coffe first?',
        choices: [
          { choice: 8, text: 'Coffee, coffee, coffee!'},
          { choice: 9, text: 'Straight to the labs'},
        ],
      },
      {
        id: 7,
        description: 'You sit down in the cool group, they continue to laugh and joke along with you, you waste a few hours screwing around, but make some friends. You hear labs are coming up soon, do you want a coffe first?',
        choices: [
          { choice: 8, text: 'Coffee, coffee, coffee!'},
          { choice: 9, text: 'Straight to the labs'},
        ],
      },
      {
        id: 8,
        description: "The coffee here taste's great, better than that crap you get from 'popular coffee franchise, you know the one' you eagerly take on the labs",
        choices: [
          { choice: 9, text: 'Take on the labs!'},
        ],
      },
      {
        id: 9, #Kind of plain without a battle encounter
        description: "You take on the labs, they've realised 81 on the first day. How is this fair?",
        choices: [
          { choice: 10, text: 'You move onto lunch'},
        ],
      },
      {
        id: 10,
        description: "Rewarding yourself with a nice lunch after all of those labs, youve been invited to mediatate or play the campus game Cambio",
        choices: [
          { choice: 11, text: 'Meditate'},
          { choice: 11, text: 'Ill try out cambio'},
        ],
      },
      {
        id: 11,
        description: "After you're done you head home and rest",
        choices: [
          { choice: 12, text: 'On to day 2'},
          { choice: 13, text: 'On to day 2'},
        ],
      },
      {
    id: 1,
    description: "OH SHIT! It's 7.30! You're late!!",
          choices: [
  { choice: 2, text: 'Oh what the hell. Its too late anyway. Might as well relax
                       and have a boiled egg.'},
  { choice: 3, text: 'Run Forrest, run!'},
],
},
{
id: 2,
description: "Of course you're late and Nico has started his lecture. At the
              speed he goes, you've probably missed a hell of a lot of knowledge.",
choices: [
  { choice: 4, text: 'I can totally sneak in unnoticed...'},
  { choice: 5, text: 'Its too late now. Im going for the buscuit jar.'},
],
},
{
id: 3,
description: "You make it on time but you smell like a Louisiana swamp.",
choices: [
  { choice: 6, text: 'I think WeWork has showers. I can take a quick shower and
                      head to the leacture.'},
  { choice: 7, text: 'I dont smell anything...'},
],
},
{
id: 4,
description: "Kinda hard to sneak in in an office of glass walls but Nico, being
              as awesome as he is, accepts your appology, makes a little joke at
              your expense and tells you to come in.",
choices: [
  { choice: 6, text: 'Great! So tell me, Does Xabi like Metallica or Swift...'},
],
},
{
id: 5,
description: "Ok silliness aside, remember you're here on your own accord so
              lets get serious.",
choices: [
  { choice: 8, text: 'Yes, youre right. Ill catch up on the last 100 labs.'},
  { choice: 8, text: 'Get off my case Mom!'},
]
},
{
id: 6,
description: 'Lecture over, knowledge emparted. Can you feel the power? ',
choices: [
  { choice: 8, text: 'Yes! But now Im starving, time for lunch!'},
  { choice: 8, text: 'I think Ill catch up on some labs.'},
]
},
{
id: 7,
description: "Remember the talk we had on feedback? Well, there's a few angry
              faces around your desk today. Everyones gets together and hold an
              intervention, 'Dude, you smell bad...sorry!''.",
choices: [
  { choice: 22, text: 'I cant bare the shame. Im going home.'},
]
},
{
id: 8,
description: "Lucy has Slacked everyone to remind you that you are presenting
              your first blog post tomorrow, have you done it or even thought about it?",
choices: [
  { choice: 9, text: 'Ummm, Im kinda stuck on ideas. Im gonna go look for Lucy.'},
  { choice: 10, text: 'Actually I have a great idea! Im gonna get working on that now.'},
]
},
{
id: 9,
description: "You go on a quest in search of Lucy, she hasnt been seen in a while...",
choices: [
  { choice: 11, text: 'I think I saw her going towards the pods.'},
]
},
id: 10,
description: "Great, so you get working on that, and dont forget, when it comes
              to memes, more is more!",
choices: [
  { choice: 9, text: 'Ok shhhh , youre disracting me!'},
]
},
id: 11,
description: "You look inside the pods but all the doors are open and no ones
              inside, excpet....the one at the back seems to be glowing and the
              door is closed.",
choices: [
  { choice: 12, text: 'Woah...Im kinda scared but lets check it out.'},
  { choice: 12, text: 'Oh heell no! Ill just wait here, uh, till shes done...I guess.'},
]
},
id: 12,
description: "You tiptoe towards the pod, flinching as it sparks and glows violently.",
choices: [
  { choice: 13, text: 'Bill? Ted? Lucy??'},
  { choice: 13, text: 'I am over loaded with 80s film refrences! Maybe someones
                      just watching a movie in there?'},
]
},
id: 13,
description: "You grab the handle but its locked and theres currents of electricity
              bolting around the your hand.",
choices: [
  { choice: 14, text: 'Pull harder! I HAVE TO KNOW WHATS INSIDE!'},
  { choice: 15, text: 'IM COMING TO SAVE YOU LUCY!!'},
]
},
id: 14,
description: "You pull and pull until it breaks open with a bright light washing
              over the whole floor.",
choices: [
  { choice: 16, text: 'What is happening?! Oh hey Steve Jobs, what what!?'},
]
},
id: 15,
description: "You run back, build momentum and run towards the door but just as
              youre about to smash into it, it opens and a bright light washes over the whole floor.",
choices: [
  { choice: 16, text: 'Wooah! Flatiron coffee is strong as hell!'},
]
},
id: 16,
description: "You fly or fall (Youre not really sure which way up you are) through
              the void until you reach a sudden stop. Youre pushed upright and just
              float calmly infront of a large seethrough screen with a few lines of
              glowing code. A voice declares, 'This, is your first code challenge.
              Should you wish to accept, you will be asked to solve one of two questions:'",
choices: [
  { choice: 17, text: 'Say Hello to the world.'},
  { choice: 18, text: 'What is the meaning of life?'},
]
},
id: 17,
description: "Remember, the fate of Lucy rests in your hands. GOOD LUCK, DUDE!",
choices: [
  { choice: 20, text: 'puts "Hello World!"'},
  { choice: 19, text: 'def say_hello
                          puts "Hello World!"
                       end'},
  { choice: 20, text: 'def say_hello
                          "Hello World!"
                       end'},
]
},
id: 18,
description: "Psst. Ask him if you can use Google.",
choices: [
  { choice: 20, text: 'def the_meaning_of_life
                          if meaning === love && me === single
                            puts "Lonelyyy, I am so lonelyyy."
                          elsif
                            puts "Im killin it!"
                          else
                            self.end_it_all
                       end'},
  { choice: 20, text: 'def the_meaning_of_life
                          puts "To be or not to be."
                       end'},
  { choice: 19, text: 'DOGS!'},
]
},
id: 19,
description: "GLING! The screen begins to glow and you hear the voice say, 'YOU
              have passed the code challenge. Lucy awaits on the otherside.'.
              Suddenly, you begin to fall again utnil you drop back into the pod,
              excpet this time its empty and calm. The lights are on and your
              laptop is infront of you. You then hear Lucy call you.",
choices: [
  { choice: 21, text: '"Im coming!!"'},
  { choice: 22, text: 'I am exhausted. Im off. Ciao!'},
]
},
id: 20,
description: "Oh MAN! What have you done! The screen is now glowing red and the
              voice sounds angry, 'FOOL! You have failed. I hereby banish you to
              the online bootcamp!'. ",
{ choice: 200, text: 'GAME OVER'},
},
id: 21,
description: "You get Lucys help and all is well in the world of FLatiron. What
              do you want to do for the rest of your evening?",
choices: [
  { choice: 22, text: 'I think Ill work on the blog and head home.', effect: {energy: -20} },
  { choice: 22, text: 'I think Ill head home. Im gonna have some crazy ass dreams tonight!'},
]
},
id: 22,
description: "Home sweet home. You get into bed and passout instantly...enjoy those
              coding dreams mwahahaha!",
{ choice: 50, text: 'Tomorrow, tomorrw, I love yaa tomorrow!!'},
},
]
    @current_scenario = @story[0]

  end

  def create_user
    name = @prompt.ask("What's your name?")
    user_setup(name)
    pry
  end

  def choose_scenario
    choice = @prompt.select("What would you like to do?:")
    @current_scenario = story.find { |scenario| scenario[:id] == choice }
  end

  def display_current_scenario
    puts "                              "
    puts @current_scenario[:description]

    # puts @current_scenario[:choices]
    choice = @prompt.select("****") do |menu|
      @current_scenario[:choices].each do |choice|
        menu.choice name: choice[:text], value: choice
      end
    end
    next_scenario_id = choice[:choice]
    effects = choice[:effects]
    effects.each do |key, value|
      @user.key += value
    end
    # apply these effects to the @user

    @current_scenario = @story.find { |scenario| scenario[:id] == next_scenario_id }
    display_current_scenario
  end

  def run
    create_user
    display_current_scenario
  end
  binding.pry
  p "done"
end
#
# { #Start day 3
#   id: 50,
#   description: "You wake up refreshed and head into school. You eagerly get to work, its going smoothly. You notice someone keeps playing youtube videos out loud. How do you want to adress this?"
#   choices: [
#     { choice: 51, text: 'Ignore them.'},
#     { choice: 52, text: 'Give them feedback.'},
#   ],
# },
# {
#   id: 51,
#   description: "They continue to be obnoxious and annoying. Disrupting everyone",
#   choices: [
#     { choice: 55, text: 'Continue'},
#   ],
# },
# {
#   id: 52,
#   description: "You wait for a good oppurtunity to give feedback, they're not being very receptive. Do you continue being positive or rip into them?",
#   choices: [
#     { choice: 53, text: 'Talk to them sternly'},
#     { choice: 54, text: 'Be proffesional'},
#   ]
# },
# {
#   id: 53,
#   description: "You get angry and tell them straight how they're acting, getting your point across",
#   choices: [
#     { choice: 55, text: 'Continue'},
#   ]
# },
# {
#   id: 54,
#   description: "You keep your cool and explain rationally, eventually they get the point",
#   choices: [
#     { choice: 55, text: 'Continue'},
#   ]
# },
# {
#   id: 55,
#   description: "They've finally stopped and you get back to work. You get to a lab on ActiveRecord and get stuck. Which resource do you use to solve this?",
#   choices: [
#     { choice: 56, text: "Google the issue"},
#     { choice: 57, text: "Ask a TCF for help and guidance "},
#     { choice: 58, text: "Search Stack Overflow"},
#   ]
# },
# {
#   id: 56,
#   description: "You google the question, there isnt much help on here. You even go to the baren wastelands of page 2 of google. Nothing. Now what?",
#   choices: [
#     { choice: 58 , text: 'Stack Overflow'},
#     { choice: 57 , text: 'Ask a TCF'},
#   ]
# },
# {
#   id: 57,
#   description: "You ask a TCF for help with the lab, they explain it to you. Doing most of it for you",
#   choices: [
#     { choice: 59, text: 'Continue'},
#   ]
# },
# {
#   id: 58,
#   description: "You search around Stack Overflow, you notice other people have asked the question, got no reply and then edited 'Problem solved' without saying how, typical! What do you do now?",
#   choices: [
#     { choice: 56, text: 'Google it'},
#     { choice: 57, text: 'Ask a TCF'},
#   ]
# },
# {
#   id: 59,
#   description: "You continue to study throughout the day. Not noticing the time its now 6:30 and youve been invited to get a beer downstairs. Do you go and socialize, go home, or stay and work for another hour?",
#   choices: [
#     { choice: 60, text: 'Beer obviously'},
#     { choice: 61, text: 'Home time'},
#     { choice: 62, text: 'Id rather work on my own'},
#   ]
# },
# {
#   id: 60,
#   description: "You have a few beers in the lobby, and you enjoy socializing. Your classmates are pretty cool. Stay for more?",
#   choices: [
#     { choice: 63, text: 'Stay for more'},
#     { choice: 61, text: 'Head home'},
#   ]
# },
# {
#   id: 61,
#   description: "You head home after a productive day and get some sleep",
#   choices: [
#     { choice: 65, text: 'On to day 4'},
#   ]
# },
# {
#   id: 62,
#   description: "You stay for a bit longer, keeping on top of labs. Then head home",
#   choices: [
#     { choice: 65, text: 'On to day 4'},
#   ]
# },
# {
#   id: 63,
#   description: "You have a few more drinks, you get talking to some people in the mod above you, who tell you some invaluable information about the upcoming code challenge. You feel pretty tipsy at this point, and it would be unwise to stay for more. Stay for more drinks?",
#   choices: [
#     { choice: 64, text: 'Even more drinks'},
#     { choice: 65, text: "Im good, i'll head home"},
#   ]
# },
# {
#   id: 64,
#   description: "You've had way too much. You make a complete mess of yourself, throwing up in the bathroom. Security escorts you out. You dont have to go home, but you cant stay here. You go home anyway.",
#   choices: [
#     { choice: 65, text: 'On to day 4'},
#   ]
# },
# { #Start day 4
#   id: 100,
#   description: "After unpacking your bag and quickly checking your slack & email, you see a message
#   from Ben informing you that there is breakfast in the lobby. Do you...? "
#   choices: [
#     { choice: 101, text: 'Go down to the lobby with your friend'},
#     { choice: 102, text: 'Start work'}
#   ],
#     },
#     {
#   id: 101,
#   description: "You arrive in the Lobby to the sight of many little pots on the counter.
#   You take a pot of oats and a yoghurt and are about to turn towards the lifts when Laura asks if you want to get a coffee from the barista.",
#   choices: [
#     { choice: 105, text: 'Stay for coffee with Laura'},
#     { choice: 102, text: 'Head back upstairs with your breakfast'}
#   ],
#   },
#   {
#   id: 102,
#   description: "Knowing that you have a lecture on a new topic coming up, you sit at your desk and think about where to start work.
#   You have about 30 incomplete labs from previous topics but don't think you should move on yet. There is a message to focus on being ready for the lecture.",
#   choices: [
#     { choice: 104, text: 'Catch up on previous topics'},
#     { choice: 103, text: 'Familiarize yourself with new material'},
#       ]
#   },
#   {
#   id: 103,
#   description: "Lecture scenario A When the time comes, you feel at ease during the lecture and are happily asking questions and moving along",
#   choices: [
#     { choice: 106, text: 'continue'},
#     ]
#   },
#   {
#   id: 104,
#   description: "Lecture scenario B You sit down for the lecture and from the first moment you struggle to follow the logic, you don't even know where to begin with asking questions.
#   The others seem to be engaging and you feel overwhelmed",
#   choices: [
#     { choice: 106, text: 'continue'},
#   ]
#   },
#   {
#   id: 105,
#   description: "Lecture scenario C You only just make it to the lecture, clutching your barista coffee. Nico might as well be speaking a different language.",
#   choices: [
#     { choice: 106, text: 'continue'},
#     ]
# }
