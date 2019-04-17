require 'pry'


class CLI

attr_accessor :user, :story, :current_scenario, :energy, :stress, :knowledge

  def initialize
    @prompt = TTY::Prompt.new
  end

  def user_setup(name)
    @user = User.create(name: name)
    @story = [
{ #Start day 1
id: 1,
description: "Good morning #{@user.name}. You've just woken up for your first day at Flatiron School.
              Do you want to get up early and have a healthy breakfest or go back to sleep?",
choices: [
  { choice: 2, text: 'Hit snooze.', effects: {stress: 10, knowledge: 10, energy: -10}},
  { choice: 3, text: 'Get up.', effects: {stress: 1}},
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
  { choice: 6, text: 'The nerds?', effects: {stress: 10, knowledge: 10, energy: -100}},
  { choice: 7, text: 'The cool group!', effects: {stress: 10, knowledge: 10, energy: -100}},
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
  { choice: 200, text: 'Onto day 5'},
],
},
{
id: 154,
description: "Lecture scenario B You sit down for the lecture and from the first moment you struggle to follow the logic, you don't even know where to begin with asking questions.
  The others seem to be engaging and you feel overwhelmed",
choices: [
  { choice: 200, text: 'Onto day 5'},
],
},
{
id: 155,
description: "Lecture scenario C You only just make it to the lecture, clutching your barista coffee. Nico might as well be speaking a different language.",
choices: [
  { choice: 200, text: 'Onto day 5'},
],
},
{
id: 200,
description: "Well, the day has come, you have passed all the code challenges,
              impressed the teachers and proven yourself to be a true programmer.
              And now for the final challenge, THE JOB HUNT! You will go through
              and interview involving a code challenge and a personality test but
              dont worry, you got this!",
choices: [
  { choice: 201, text: 'Eye of the Tiger!'},
  { choice: 201, text: 'Im open to any opportunity that comes my way!'},
  { choice: 201, text: 'Oh man! This is the moment of truth. What if I dont find
                        a job? What if Im not good enough? What if I fail all the
                        code challenges? What if the aliens invade...'},
],
},
{
id: 201,
description: "Ok its time to start he search. Lets try out a few job search platforms.",
choices: [
  { choice: 202, text: 'Linkedin, what else.'},
  { choice: 203, text: 'Actaully, escape the city is pretty cool, make sure Im safe
                        from the big corporate monsters.'},
  { choice: 204, text: 'Im gonna hit them all and shower my CV all over London, hell,
                        the whole world!'},
],
},
{
id: 202,
description: "Ok, well thats very network heavy so maybe send a few DMs and arrange
              coffee dates?",
choices: [
  { choice: 209, text: 'Nah, I think Ill just apply to the job postings...and send
                        follow up DMs.'},
  { choice: 209, text: 'I hate networking but ok.'},
],
},
{
id: 203,
description: "That sounds great! A little hipster, but great!
              And look, a few postings already! You can apply to both but lets focus
              on one for now.",
choices: [
  { choice: 205, text: 'Web Developer at a food start up selling Japanese Macha products.'},
  { choice: 206, text: 'Full stack developer at an animals welfare charity.'},
  { choice: 207, text: 'Swift developer for IOS app at a sustainable fashion startup.'},
],
},
{
id: 204,
description: "Woah Nelly! Now we both know that is no way to go about the job hunt.
              You have to be more specific and focused. When your attention is all
              pointing in one direction, you come across as a stronger candidates
              to employers. So pick a sector and focus your applications towards
              companies that fit the description.",
choices: [
  { choice: 208, text: 'But what if I dont know what industry I want to go into?'},
  { choice: 209, text: 'Hmmmm ok. Ill have a think about it.'},
],
},
{
id: 205,
description: "Let me guess, based in Notting Hill?",
choices: [
  { choice: 209, text: 'How did you guess!'},
],
},
{
id: 206,
description: "That's a great one! Two birds with one stone, a stisfying career and a happy soul.",
choices: [
  { choice: 209, text: 'Interesting choice of expression...but yes, youre right.'},
],
},
{
id: 207,
description: "Hmmm, now that might be a little above your skill set but you should always
              apply, you have nothing to loose.",
choices: [
  { choice: 209, text: 'Well, thanks to Flatiron, I can teech myself any language! (cheese alert)'},
],
},
{
id: 208,
description: "Ok well, lets take a look at a few options:",
choices: [
  { choice: 209, text: 'Tech'},
  { choice: 209, text: 'Food'},
  { choice: 209, text: 'Fashion'},
  { choice: 209, text: 'Media'},
  { choice: 209, text: 'Health and fitness'},
  { choice: 209, text: 'Banking'},
  { choice: 209, text: 'Life Style'},
  { choice: 209, text: 'Charity'},
],
},
{
id: 209,
description: "Ok, so youve set up an interview. Now listen, the less you want this the cooler and calmer
              youll come across as a desirable candidate. So try to forget about how much
              is riding on this. Dont think abou how much you need the money to pay the rent.
              And definetaley do not think about the fact that youve only been coding for
              fifteen weeks. Get all of that down and youll be juuust fine!",
choices: [
  { choice: 210, text: 'Oh shut up. Im gonna kill it!'},
  { choice: 350, text: 'Right. Im out.'}, GAME OVER
],
},
{
id: 210,
description: "First, the Code Challenge:
              Its your first year at Hogwarts and youre having a tough time getting
              the hang of that levitation spell. Fill out the content of the method
              looping to contain a loop that puts the levitation charm 'Wingardium Leviosa'
              an infinite number of times.",
choices: [
  { choice: 211, text: 'def looping
                          return "Wingardium Leviosa"
                        end'},
  { choice: 212, text: 'def looping
                          puts "Wingardium Leviosa"
                        end'},
  { choice: 211, text: 'def looping
                          puts "wingardium leviosa"
                        end'},
],
},
{
id: 211,
description: "Dude, no...Im sorry. Its a fail Im affraid.",
choices: [
  { choice: 350, text: ''}, GAME OVER
],
},
{
id: 212,
description: "DING DING DING! You are through to round two. The Personality Test.",
choices: [
  { choice: 171, text: 'YES!! Killed it!'},
],
},
{
id: 213,
description: "Personality Test Question 1:
              You have been stuck on a line of code or a bug for a couple of hours
              and there doesnt seem to be a way out, what do you do?",
choices: [
  { choice: 214, text: 'Ask a colleague for help.'},
  { choice: 214, text: 'Ask your superior.'},
  { choice: 214, text: 'Keep Googling, where theres a will, theres a way.'},
],
},
{
id: 214,
description: "Personality Test Question 2:
              Its pub quiz and pizza night! The rule is, each person gets one slice
              but it seems to be getting quiet and the bpx is sitting there, unattended.
              Do you take a second slice?",
choices: [
  { choice: 215, text: 'Why not? No one is looking.'},
  { choice: 215, text: 'I would ask if anyone wants it.'},
  { choice: 215, text: 'Never. Rules are made to be obayed.'},
],
},
{
id: 215,
description: "Personality Test Question 2:
              A charity collection takes place in your office. For every UK£10.00 given,
              a blind person's sight is restored. Instead of donating UK£10.00, you use
              the money to treat yourself to a cocktail after work. Are you morally responsible
              for the continued blindness of the person who would have been treated had you made the donation?",
choices: [
  { choice: 216, text: 'Hell no!'},
  { choice: 216, text: 'I would never have that cocktail though...of course I would donate the money.'},
  { choice: 216, text: 'Yes you are. It was in your hand to save them and you didnt for a trivial persuit.'},
],
},
{
id: 216,
description: "You have passed, both, the Code Challenge and the Personality Test.
              Congratulations, you have got the job! You are about to start the
              next chapter of your life as a software engineer. How does it feel,
              knowing you did this all yourself? All the hard work, late nights and self-doubt?",
choices: [
  { choice: 351, text: 'I am speechless.'},
  { choice: 351, text: 'I would like ot thank everyone at Flatiron,teachers, TCFs and students. I couldnt
                        have done it without them.'},
  { choice: 351, text: 'Awesome!'},
id: 300,
description: "You are banished to the online course",
choices: [
  { choice: 157, text: 'YOU HAVE LOST!'},
],
},
{
id: 350,
description: "You failed to find a job as a programmer :o",
choices: [
  { choice: 157, text: 'YOU HAVE LOST!'},
],
},
{
id: 351,
description: "You have secured a job as a software engineer. Life goals complete, endless riches will soon be yours",
choices: [
  { choice: 157, text: 'Ultimate win!'},
],
},
{
id: 400,
description: "You've run out of energy, you collapse to the floor and die :( ",
choices: [
  { choice: 157, text: 'YOU HAVE LOST! PRESS ENTER TO START NEW GAME!'},
],
},
]
    @current_scenario = @story[0]
  end

  def create_user
    puts "NEW GAME"
    puts "Welcome to Flatiron Simulator, Extreme Edition:"
    name = @prompt.ask("What's your name?")
    if name == nil
      puts "Please enter a valid name to continue"
      create_user
    else
      user_setup(name)
    end
  end

  # def choose_scenario
  #   choice = @prompt.select("What would you like to do?:")
  #   if @current_scenario[:choice] == 156
  #     puts "Spongebob"
  #   else
  #     @current_scenario = story.find { |scenario| scenario[:id] == choice }
  #   end
  # end

  def display_current_scenario
    if @user.energy <= 0
     @current_scenario = @story.last
     binding.pry
    end
    puts "                              "
    puts "Your current stats are #{@user.knowledge} knowledge, #{@user.stress} stress and #{@user.energy} energy "
    puts @current_scenario[:description]

    # puts @current_scenario[:choices],
    choice = @prompt.select("****") do |menu|
      @current_scenario[:choices].each do |choice|
        menu.choice name: choice[:text], value: choice
      end
    end

    effects = choice[:effects]
    if effects
      effects.each do |key, value|
        @user[key] += value
      end
    end


    if choice[:choice] != 156 && choice[:choice] != 157
      next_scenario_id = choice[:choice]
    else
      run
    end



    # apply these effects to the @user

    @current_scenario = @story.find { |scenario| scenario[:id] == next_scenario_id }
    display_current_scenario
  end

  def run
    create_user
    display_current_scenario
  end
end
