require 'pry'


class CLI

attr_accessor :user, :story, :current_scenario, :energy, :stress, :knowledge

  def initialize
    @prompt = TTY::Prompt.new(interrupt: :exit)
  end

  def user_setup(name)
    @user = User.create(name: name)
    @story = [
{ #Start day 1
  id: 1,
  description: "This is a 5 day ultra-realistic simulation of a totally typical time at Flatiron School. Try to make it to the end and get a sweet ass job, whilst gaining
  enough knowledge to defeat the dastardly Code Challenges. Make sure you keep an eye on your energy, if you let it drop below 0 you will die... of Death.

  Good morning #{@user.name}. You've just woken up for your first day at Flatiron School.
  Do you want to get up early and have a healthy breakfest or go back to sleep?",
  choices: [
    { choice: 2, text: 'Hit snooze.', effects: {stress: 50, energy: -10}},
    { choice: 3, text: 'Get up.', effects: {stress: 5, energy: -20}},
  ],
  },
  {
  id: 2,
  description: "You hit snooze a few too many times, and now need to rush into class.",
  choices: [
    { choice: 5, text: 'Take the train.', effects: {stress: 30, energy: 10}},
    { choice: 5, text: 'Cycle.', effects: {stress: -10, energy: -30}},
    { choice: 5, text: 'Run.', effects: {stress: -95, energy: -50}},
  ],
  },
  {
  id: 3,
  description: "You wake up nice and early, and enjoy a healthy breakfast! You've got some spare time. How are you getting to school?",
  choices: [
    { choice: 5, text: 'Walk.', effects: {stress: 50, energy: 10}},
    { choice: 5, text: 'Get the tube.', effects: {stress: 50, energy: 10}},
  ],
  },
  {
  id: 5,
  description: 'You arrive at school eager and ready to learn. You notice that everyone else is already seated. Looking around, people have split into two distinct groups, who do you want to sit with and be stuck with til the end of time?',
  choices: [
    { choice: 6, text: 'The nerds?', effects: {stress: 10, knowledge: 40, energy: -10}},
    { choice: 7, text: 'The cool group!', effects: {stress: 10, knowledge: 10, energy: -30}},
  ],
  },
  {
  id: 6,
  description: 'You sit with the nerds (You look like you fit right in), you mingle a bit and get straight to work. You hear labs are coming up soon, do you want a coffee first?',
  choices: [
    { choice: 9, text: 'Straight to the labs!', effects: {stress: 50, knowledge: 45, energy: -50}},
    { choice: 8, text: 'Coffee, coffee, coffee!', effects: {stress: 25, energy: 60}},
  ],
  },
  {
  id: 7,
  description: 'You sit down with the cool kids, they continue to laugh and joke along with you, you waste a few hours screwing around, but make some friends. You hear labs are coming up soon, do you want a coffee first?',
  choices: [
    { choice: 8, text: 'Coffee, coffee, coffee!', effects: {stress: 25, energy: 60}},
    { choice: 9, text: 'Straight to the labs!', effects: {stress: 50, knowledge: 45, energy: -50}},
  ],
  },
  {
  id: 8,
  description: "The coffee here tastes great, better than that utter crap you get from (insert popular coffee franchise here). Feeling freshly energised you eagerly take on the labs.",
  choices: [
    { choice: 9, text: 'Take on the labs!', effects: {stress: 25, knowledge: 60, energy: -100}},
  ],
  },
  {
  id: 9, #Kind of plain without a battle encounter
  description: "You take a look at the labs and are dismayed to see they have released 81 on the first day. How is this fair?",
  choices: [
    { choice: 10, text: 'Sack that nonsense off and move onto lunch.', effects: {stress: -20, knowledge: -10, energy: 70}},
  ],
  },
  {
  id: 10,
  description: "Rewarding yourself with a nice lunch after all of those labs, you've been invited to mediatate or play the campus game, Cambio",
  choices: [
    { choice: 11, text: 'Meditate.', effects: {stress: -100, knowledge: 50, energy: 50}},
    { choice: 11, text: "I'll try out cambio!", effects: {stress: -45, knowledge: 10, energy: -15}},
  ],
  },
  {
  id: 11,
  description: "And now, its time, for, The Evolution game! The first ice breaker. It's a rock paper scissor game where you go from egg->chicken->dinosaur->wizard. You all start as an egg, and have to seek out people at the same stage as you and challenge them to a game. If you win you evolve, if not, you join them. The game starts and you eagerly seek out an oppenent. Which do you pick?",
  choices: [
    { choice: 12, text: "Rock", effects: {energy: 5, knowledge: 10}},
    { choice: 15, text: "Paper", effects: {energy: 0}},
    { choice: 12, text: "Scissors", effects: {energy: 5, knowledge: 10}},
  ],
  },
  {
  id: 12,
  description: "Cuckity cluck! You win the first round and have evolved to a chicken and gained a supporter. You search for another chicken and comence battle!",
  choices: [
    { choice: 15, text: "Rock", effects: {energy: 5, knowledge: 20}},
    { choice: 13, text: "Paper", effects: {energy: 0}},
    { choice: 13, text: "Scissors", effects: {energy: 5, knowledge: 20}},
  ],
  },
  {
  id: 13,
  description: "You win the second round! You now have 3 supporter's and have evolved to a dinosaur. Feeling pumped you move onto your last opponent, with your squad cheering you on.",
  choices: [
    { choice: 14, text: "Rock", effects: {energy: 25, knowledge: 50}},
    { choice: 15, text: "Paper", effects: {energy: 0}},
    { choice: 15, text: "Scissors", effects: {energy: 0}},
  ],
  },
  {
  id: 14,
  description: "You've won the last and final round! You've become a very knowledgeable Wizard. You celebrate with your team and then head home." ,
  choices: [
    { choice: 51, text: "I'm a what?", effects: {energy: 5, knowledge: 20}},
  ],
  },
  {
  id: 15,
  description: "You've been beaten in a game of pure skill. How did you make such a terrible mistake. You join your oppenent and watch out the remainder of the tournament." ,
  choices: [
    { choice: 51, text: "Fatality", effects: {energy: 5, knowledge: 20}},
  ],
  },
  {
  id: 51,
  description: "OH SHIT! It's 7.30! You're late!!",
  choices: [
    { choice: 53, text: 'Run Forrest, run!', effects: {stress: 50, energy: -85}},
    { choice: 52, text: "Oh what the hell. It's too late anyway. Might as well relax
                         and have a boiled egg.", effects: {stress: -10, energy: 30}},
  ],
  },
  {
  id: 52,
  description: "Of course, you're late and Nico has started his lecture. At the speed he goes, you've probably missed a hell of a lot of knowledge.",
  choices: [
    { choice: 54, text: 'I can totally sneak in unnoticed...', effects: {stress: 15}},
    { choice: 55, text: "It's too late now. I'm going for the buscuit jar.", effects: {stress: -20, knowledge: -10, energy: 20}},
  ],

  },
  {
  id: 53,
  description: "You make it on time but you smell like a Louisiana swamp.",
  choices: [
    { choice: 56, text: 'I think WeWork has showers. I can take a quick shower and
                        head to the lecture.', effects: {stress: -70, energy: 70}},
    { choice: 57, text: "I don't smell anything..."},
  ],
  },
  {
  id: 54,
  description: "Kinda hard to sneak into an office of glass walls but Nico, being as awesome as he is, accepts your appology, makes a little joke at your expense and tells you to come in.",
  choices: [
    { choice: 56, text: 'Great! So tell me, Does Xabi like Metallica or Swift...', effects: {stress: -20, knowledge: 65, energy: -30}},
  ],
  },
  {
  id: 55,
  description: "Ok silliness aside, remember you're here on your own accord so lets get serious.",
  choices: [
    { choice: 58, text: "Yes, you're right. Ill catch up on the last 100 labs.", effects: {stress: 50, knowledge: 95, energy: -80}},
    { choice: 58, text: 'Get off my case Mom!', effects: {stress: 50, knowledge: -10}},
  ],
  },
  {
  id: 56,
  description: 'Lecture over, knowledge emparted. Can you feel the power? ',
  choices: [
    { choice: 58, text: "Yes! But now I'm starving, time for lunch!", effects: {stress: -50, energy: 80}},
    { choice: 58, text: "I think I'll catch up on some labs.", effects: {stress: 70, knowledge: 100, energy: -75}},
  ],
  },
  {
  id: 57,
  description: "Remember the talk we had on feedback? Well, there's a few angry faces around your desk today. Everyones gets together and holds an intervention, 'Dude, you smell bad...sorry!",
  choices: [
    { choice: 72, text: "I can't bare the shame. I'm going home."}, effects: {stress: 100, knowledge: -10, energy: -100},
  ],
  },
  {
  id: 58,
  description: "Lucy has Slacked everyone to remind you that you are presenting your first blog post tomorrow, have you done it or even thought about it?",
  choices: [
    { choice: 59, text: "Ummm, I'm kinda stuck on ideas. I'm gonna go look for Lucy.", effects: {energy: -20}},
    { choice: 60, text: "Actually I have a great idea! I'm gonna get working on that now.", effects: {energy: -20}},
  ],
  },
  {
  id: 59,
  description: "You go on a quest in search of Lucy, she hasn't been seen in a while...",
  choices: [
    { choice: 61, text: 'I think I saw her going towards the pods.'},
  ],
  },
  {
  id: 60,
  description: "Great, so you get working on that, and don't forget, when it comes to memes, more is more!",
  choices: [
    { choice: 59, text: "Ok shhhh , you're disracting me!"},
  ],
  },
  {
  id: 61,
  description: "You look inside the pods but all the doors are open and no ones inside, excpet....the one at the back seems to be glowing and the door is closed...",
  choices: [
    { choice: 62, text: "Woah... I'm kinda scared but lets check it out.", effects: {stress: 45}},
    { choice: 62, text: "Oh heell no! I'll just wait here, uh, till shes done...I guess.", effects: {stress: -20}},
  ],
  },
  {
  id: 62,
  description: "You tiptoe towards the pod, flinching as it sparks and glows violently.",
  choices: [
    { choice: 63, text: 'Bill? Ted? Lucy??', effects: {stress: 80}},
    { choice: 63, text: 'I am over loaded with 80s film refrences! Maybe someones
                        just watching a movie in there?', effects: {stress: -20}},
  ],
  },
  {
  id: 63,
  description: "You grab the handle but its locked and theres currents of electricity bolting around the your hand.",
  choices: [
    { choice: 64, text: 'Pull harder! I HAVE TO KNOW WHATS INSIDE!', effects: {stress: 50, energy: -50}},
    { choice: 65, text: 'IM COMING TO SAVE YOU LUCY!!', effects: {stress: 50, energy: -50}},
  ],
  },
  {
  id: 64,
  description: "You pull and pull until it breaks open with a bright light washing over the whole floor.",
  choices: [
    { choice: 66, text: 'What is happening?! Oh hey Steve Jobs, what what!?', effects: {stress: 80, energy: 65}},
  ],
  },
  {
  id: 65,
  description: "You run back, build momentum and run towards the door but just as you're about to smash into it, it opens and a bright light washes over the whole floor.",
  choices: [
    { choice: 66, text: 'Wooah! Flatiron coffee is strong as hell!', effects: {stress: 95, energy: -85}},
  ],
  },
  {
  id: 66,
  description: "You fly or fall (You're not really sure which way up you are) through the void until you reach a sudden stop. You're pushed upright and just float calmly infront of a large seethrough screen with a few lines of glowing code. A voice declares, 'This, is your first code challenge. Should you wish to accept, you will be asked to solve one of two questions:'",
  choices: [
    { choice: 67, text: 'Say Hello to the world.', effects: {stress: 95, knowledge: -10}},
    { choice: 68, text: 'What is the meaning of life?', effects: {stress: 95, energy: -10}},
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
                              puts "I am killin it!"
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
  description: "GLING! The screen begins to glow and you hear the voice say, 'You have passed the code challenge. Lucy awaits on the otherside.'. Suddenly, you begin to fall again utnil you drop back into the pod, excpet this time its empty and calm. The lights are on and your laptop is infront of you. You then hear Lucy call you.",
  choices: [
    { choice: 71, text: " 'I'm coming!!' ", effects: {stress: -100, knowledge: 100, energy: -50}},
    { choice: 72, text: "I am exhausted. I'm off. Ciao!", effects: {stress: -100, knowledge: 100, energy: 50}},
  ],
  },
  {
  id: 70,
  description: "Oh MAN! What have you done! The screen is now glowing red and the voice sounds angry, 'FOOL! You have failed.  I hereby banish you to the online bootcamp!'. ",
  choices: [
    { choice: 170, text: 'Quit app'},
  ],
  },
  {
  id: 71,
  description: "You get Lucys help and all is well in the world of Flatiron. What do you want to do for the rest of your evening?",
  choices: [
    { choice: 72, text: "I think I'll work on the blog and head home.", effects: {stress: 45, knowledge: 80, energy: -70}},
    { choice: 72, text: "I think I'll head home. Im gonna have some crazy ass dreams tonight!", effects: {stress: -45, knowledge: -10, energy: 70}},
  ],
  },
  {
  id: 72,
  description: "Home sweet home. You get into bed and passout instantly...enjoy those coding dreams mwahahaha!",
  choices: [
    { choice: 100, text: 'Tomorrow, tomorrow, I love yaa tomorrow zzzz', effects: {stress: -100, knowledge: 45, energy: 100}},
  ]
  },
  { #Start day 3
  id: 100,
  description: "You wake up refreshed and head into school. You eagerly get to work, its going smoothly. You notice someone keeps playing youtube videos out loud. How do you want to adress this?",
  choices: [
    { choice: 101, text: 'Ignore them.', effects: {stress: 45, knowledge: -10, energy: -10}},
    { choice: 102, text: 'Give them feedback.', effects: {stress: -45, knowledge: 20, energy: -20}},
  ],
  },
  {
  id: 101,
  description: "They continue to be obnoxious and annoying. Disrupting everyone. Maybe you should have given feedback",
  choices: [
    { choice: 105, text: "Nah, it's better to leave it.", effects: {stress: 10, knowledge: -10, energy: -10}},
  ],
  },
  {
  id: 102,
  description: "You wait for a good oppurtunity to give feedback, they're not being very receptive. Do you continue being positive or rip into them?",
  choices: [
    { choice: 103, text: 'Talk to them sternly.', effects: {stress: 20, energy: -30}},
    { choice: 104, text: 'Be professional.', effects: {stress: -20, knowledge: 10}},
  ],
  },
  {
  id: 103,
  description: "You get angry and tell them straight how they're acting, getting your point across.",
  choices: [
    { choice: 105, text: 'Ok, that needed to be done... although I feel kinda bad.', effects: {stress: 50, energy: -45}},
  ],
  },
  {
  id: 104,
  description: "You keep your cool and explain rationally, eventually they get the point.",
  choices: [
    { choice: 105, text: "And that, my friend, is how it's done.", effects: {stress: -20, knowledge: 20, energy: -10}},
  ],
  },
  {
  id: 105,
  description: "They've finally stopped and you get back to work. You get to a lab on ActiveRecord and get stuck. Which resource do you use to solve this?",
  choices: [
    { choice: 106, text: "Google the issue.", effects: {stress: 35, knowledge: 65, energy: -50}},
    { choice: 107, text: "Ask a TCF for help and guidance.", effects: {stress: -35, knowledge: 50, energy: -20}},
    { choice: 108, text: "Search Stack Overflow.", effects: {stress: 35, knowledge: 45, energy: -50}},
  ],
  },
  {
  id: 106,
  description: "You Google the question, there isnt much help on here. You even go to the baren wastelands of page 2 of Google. Nothing. Now what?",
  choices: [
    { choice: 108 , text: 'Stack Overflow.', effects: {knowledge: 50, energy: -30}},
    { choice: 107 , text: 'Ask a TCF.', effects: {knowledge: 35, energy: -20}},
  ],
  },
  {
  id: 107,
  description: "You ask a TCF for help with the lab, they explain it to you. Whilst doing most of it for you. Win!",
  choices: [
    { choice: 109, text: 'I mean, they offered.', effects: {stress: -50, knowledge: 50, energy: 20}},
  ],
  },
  {
  id: 108,
  description: "You search around Stack Overflow, you notice other people have asked the question, got no reply and then edited 'Problem solved' without saying how, typical! What do you do now?",
  choices: [
    { choice: 106, text: 'Google it.', effects: {stress: 35, knowledge: 65, energy: -30}},
    { choice: 107, text: 'Ask a TCF.', effects: {stress: -35, knowledge: 50, energy: -20}},
  ],
  },
  {
  id: 109,
  description: "You continue to study throughout the day. Not noticing the time, its now 6:30 and you've been invited to get a beer downstairs. Do you go and socialize, go home, or stay and work for another hour?",
  choices: [
    { choice: 110, text: 'Beer obviously.', effects: {stress: -95, knowledge: -30, energy: 45}},
    { choice: 111, text: 'Home time.', effects: {stress: -100, knowledge: -10, energy: 100}},
    { choice: 112, text: "I'd rather work on my own.", effects: {stress: -95, knowledge: 95, energy: -80}},
  ],
  },
  {
  id: 110,
  description: "You have a few beers in the lobby, and you enjoy socializing. Your classmates are pretty cool. Stay for more?",
  choices: [
    { choice: 113, text: 'Hell yes!'},
    { choice: 111, text: "Nah, I think I'll head home."},
  ],
  },
  {
  id: 111,
  description: "You head home after a productive day and get some sleep.",
  choices: [
    { choice: 150, text: 'On to day 4', effects: {stress: -100, energy: 100}},
  ],
  },
  {
  id: 112,
  description: "You stay for a bit longer, keeping on top of labs. Then head home.",
  choices: [
    { choice: 150, text: 'On to day 4', effects: {stress: 30, knowledge: 80, energy: -95}},
  ],
  },
  {
  id: 113,
  description: "You have a few more drinks, you get talking to some people in the mod above you, who tell you some invaluable information about the upcoming code challenge. You feel pretty tipsy at this point, and it would be unwise to stay for more. Stay for more drinks?",
  choices: [
    { choice: 114, text: 'Even more drinks.', effects: {stress: 20, knowledge: 90, energy: -95}},
    { choice: 150, text: "Im good, I'll head home.", effects: {stress: -100, knowledge: -10, energy: 100}},
  ],
  },
  {
  id: 114,
  description: "You've had way too much. You make a complete mess of yourself, throwing up in the bathroom. Security escorts you out saying 'You don't have to go home, but you can't stay here'. You go home anyway.",
  choices: [
    { choice: 120, text: "You've been invited to a meeting with the principal tomorrow."},
  ],
  },
  {
  id: 120,
  description: "You nervously sit down in the meeting, they tell you that, based on your behaviour last night, you have been banished to the online course!",
  choices: [
    { choice: 170, text: "Quit app"},
  ],
  },
  { #Start day 4
  id: 150,
  description: "After unpacking your bag and quickly checking your slack & email, you see a message from Ben informing you that there is breakfast in the lobby. Do you...?",
  choices: [
    { choice: 151, text: 'Go down to the lobby with your friend.', effects: {stress: -45, knowledge: -10, energy: 35}},
    { choice: 152, text: 'Start work.', effects: {stress: 20, knowledge: 20, energy: -20}}
  ],
  },
  {
  id: 151,
  description: "You arrive in the Lobby to the sight of many little pots on the counter. You take a pot of oats and a yoghurt and are about to turn towards the lifts when Laura asks if you want to get a coffee from the barista.",
  choices: [
    { choice: 155, text: 'Stay for coffee with Laura.', effects: {stress: -20, knowledge: -10, energy: 50}},
    { choice: 152, text: 'Head back upstairs with your breakfast.', effects: {stress: 20, knowledge: 20, energy: 10}}
  ],
  },
  {
  id: 152,
  description: "Knowing that you have a lecture on a new topic coming up, you sit at your desk and think about where to start work. You have about 30 incomplete labs from previous topics but don't think you should move on yet. There is a message to focus on being ready for the lecture.",
  choices: [
    { choice: 154, text: 'Catch up on previous topics.', effects: {stress: -45, knowledge: 30, energy: -50}},
    { choice: 153, text: 'Familiarize yourself with new material.', effects: {stress: 70, knowledge: 85, energy: -50}},
  ],
  },
  {
  id: 153,
  description: "When the time comes, you feel at ease during the lecture and are happily asking questions and moving along.",
  choices: [
    { choice: 200, text: 'Onto day 5', effects: {energy: 50}},
  ],
  },
  {
  id: 154,
  description: "You sit down for the lecture and from the first moment you struggle to follow the logic, you don't even know where to begin with asking questions. The others seem to be engaging and you feel overwhelmed." , effects: {knowledge: 15},
  choices: [
    { choice: 200, text: 'Onto day 5', effects: {energy: 50}},
  ],
  },
  {
  id: 155,
  description: "You only just make it to the lecture, clutching your barista coffee. Nico might as well be speaking a different language." , effects: {stress: 20, knowledge: 5, energy: -20},
  choices: [
    { choice: 200, text: 'Onto day 5', effects: {energy: 50}},
  ],
  },
  {
  id: 200,
  description: "Well, the day has come, you have passed all the code challenges, impressed the teachers and proven yourself to be a true programmer. And now for the final challenge, THE JOB HUNT! You will go through and interview involving a code challenge and a personality test but dont worry, you got this!",
  choices: [
    { choice: 201, text: 'Eye of the Tiger!', effects: {stress: 95, knowledge: 100}},
    { choice: 201, text: "I'm open to any opportunity that comes my way!", effects: {stress: 95, energy: 100}},
    { choice: 201, text: "Oh man! This is the moment of truth. What if I dont find a job? What if I'm not good enough? What if I fail all the code challenges? What if the aliens invade...", effects: {stress: 95, energy: -85}},
  ],
  },
  {
  id: 201,
  description: "Ok it's time to start the search. Lets try out a few job search platforms.",
  choices: [
    { choice: 202, text: 'Linkedin, what else.', effects: {stress: 20, knowledge: 50, energy: -20}},
    { choice: 203, text: 'Actaully, Escape The City is pretty cool, make sure Im safe from the big corporate monsters.', effects: {stress: 20, knowledge: 50, energy: -20}},
    { choice: 204, text: "I'm gonna hit them all and shower my CV all over London, hell, the whole world!", effects: {stress: 50, knowledge: -20, energy: -85}},
  ],
  },
  {
  id: 202,
  description: "Ok, well thats very network heavy so maybe send a few DMs and arrange coffee dates?",
  choices: [
    { choice: 209, text: 'Nah, I think Ill just apply to the job postings...and send follow up DMs.', effects: {stress: 10, knowledge: 35, energy: -50}},
    { choice: 209, text: 'I hate networking but ok.', effects: {stress: 50, knowledge: 50, energy: -50}},
  ],
  },
  {
  id: 203,
  description: "That sounds great! A little hipster, but great! And look, a few postings already! You can apply to both but lets focus on one for now.",
  choices: [
    { choice: 205, text: 'Web Developer at a food start up selling Japanese Macha products.'},
    { choice: 206, text: 'Full stack developer at an animals welfare charity.'},
    { choice: 207, text: 'Swift developer for IOS app at a sustainable fashion startup.'},
  ],
  },
  {
  id: 204,
  description: "Woah Nelly! Now we both know that is no way to go about the job hunt. You have to be more specific and focused. When your attention is all pointing in one direction, you come across as a stronger candidates to employers. So pick a sector and focus your applications towards companies that fit the description.",
  choices: [
    { choice: 208, text: 'But what if I dont know what industry I want to go into?', effects: {stress: 65, knowledge: -20}},
    { choice: 209, text: 'Hmmmm ok. Ill have a think about it.', effects: {stress: 35, knowledge: 35, energy: -20}},
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
    { choice: 209, text: "Interesting choice of expression...but yes, you're right.", effects: {knowledge: 50}},
  ],
  },
  {
  id: 207,
  description: "Hmmm, now that might be a little above your skill set but you should always apply, you have nothing to loose.",
  choices: [
    { choice: 209, text: 'Well, thanks to Flatiron, I can teach myself any language! (cheese alert)', effects: {stress: -65, knowledge: 95}},
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
  description: "Ok, so you've set up an interview. Now listen, the less you want this the cooler and calmer you'll come across as a desirable candidate. So try to forget about how much is riding on this. Don't think abou how much you need the money to pay the rent. And definitely do not think about the fact that you've only been coding for fifteen weeks. Get all of that down and you'll be juuust fine!",
  choices: [
    { choice: 210, text: "Oh shut up. I'm gonna kill it!", effects: {stress: -20, knowledge: 85, energy: -20}},
    { choice: 350, text: "Right. I'm out."},
  ],
  },
  {
  id: 210,
  description: "First, the Code Challenge: It's your first year at Hogwarts and youre having a tough time getting the hang of that levitation spell. Fill out the content of the method looping to contain a loop that puts the levitation charm 'Wingardium Leviosa' an infinite number of times.",
  choices: [
    { choice: 211, text: 'def looping return "Wingardium Leviosa" end', effects: {stress: 100, knowledge: -100, energy: -100}},
    { choice: 212, text: 'def looping puts "Wingardium Leviosa" end', effects: {stress: -100, knowledge: 100, energy: 100}},
    { choice: 211, text: 'def looping puts "wingardium leviosa" end', effects: {stress: 100, knowledge: -100, energy: -100}},
  ],
  },
  {
  id: 211,
  description: "Dude, no... I'm sorry. Its a fail Im affraid.",
  choices: [
    { choice: 170, text: 'Quit app'},
  ],
  },
  {
  id: 212,
  description: "DING DING DING! You are through to round two. The Personality Test.",
  choices: [
    { choice: 214, text: 'YES!! Killed it!'},
  ],
  },
  {
  id: 213,
  description: "Personality Test Question 1: You have been stuck on a line of code or a bug for a couple of hours and there doesnt seem to be a way out, what do you do?",
  choices: [
    { choice: 214, text: 'Ask a colleague for help.', effects: {stress: -50, knowledge: 50, energy: 50}},
    { choice: 214, text: 'Ask your superior.', effects: {stress: -10, knowledge: 10, energy: 10}},
    { choice: 214, text: 'Keep Googling, where theres a will, theres a way.', effects: {stress: 20, knowledge: 50, energy: -50}},
  ],
  },
  {
  id: 214,
  description: "Personality Test Question 2: Its pub quiz and pizza night! The rule is, each person gets one slice but it seems to be getting quiet and the box is sitting there, unattended. Do you take a second slice?",
  choices: [
    { choice: 215, text: 'Why not? No one is looking.', effects: {stress: 20, knowledge: -20, energy: -20}},
    { choice: 215, text: 'I would ask if anyone wants it.', effects: {stress: -50, knowledge: 50, energy: 50}},
    { choice: 215, text: 'Never. Rules are made to be obayed.', effects: {stress: 20, knowledge: -20, energy: -20}},
  ],
  },
  {
  id: 215,
  description: "Personality Test Question 2: A charity collection takes place in your office. For every UK£10.00 given, a blind person's sight is restored. Instead of donating UK£10.00, you use the money to treat yourself to a cocktail after work. Are you morally responsible for the continued blindness of the person who would have been treated had you made the donation?",
  choices: [
    { choice: 216, text: 'Hell no!'},
    { choice: 216, text: 'I would never have that cocktail though...of course I would donate the money.'},
    { choice: 216, text: "Yes you are. It was in your hand to save them and you didn't for a trivial persuit."},
  ],
  },
  {
  id: 216,
  description: "You have passed, both, the Code Challenge and the Personality Test. Congratulations, you have got the job! You are about to start the next chapter of your life as a software engineer. How does it feel, knowing you did this all yourself? All the hard work, late nights and self-doubt?",
  choices: [
    { choice: 351, text: 'I am speechless.', effects: {stress: -100, knowledge: 100, energy: 100}},
    { choice: 351, text: 'I would like ot thank everyone at Flatiron,teachers, TCFs and students. I couldnt
                          have done it without them.', effects: {stress: -100, knowledge: 100, energy: 100}},
    { choice: 351, text: 'Awesome!', effects: {stress: 100, knowledge: -100, energy: 100}},
  ],
  },
  {
  id: 300,
  description: "You are banished to the online course.",
  choices: [
    { choice: 170, text: 'Quit app', effects: {stress: 100, knowledge: -100, energy: -100}},
  ],
  },
  {
  id: 350,
  description: "You failed to find a job as a programmer.",
  choices: [
    { choice: 170, text: 'Quit app', effects: {stress: 100, knowledge: -100, energy: -100}},
  ],
  },
  {
  id: 351,
  description: "You have secured a job as a software engineer. Life goals complete, endless riches will soon be yours.",
  choices: [
    { choice: 170, text: 'Ultimate win!', effects: {stress: -100, knowledge: 100, energy: 100}},
  ],
  },
  {
  id: 400,
  description: "You've run out of energy, you collapse to the floor and die :( ",
  choices: [
    { choice: 157, text: 'Quit app'},
  ],
  },
  ]
    @current_scenario = @story[0]
  end

  def create_user
    pastel = Pastel.new
    titlefont = TTY::Font.new(:doom)
    puts pastel.red(titlefont.write("NEW GAME"))
    puts Rainbow("Welcome to Flatiron Simulator, Extreme Edition:").color(:mediumslateblue).bright
    name = @prompt.ask("What's your name?")
    if name == nil
      puts "Please enter a valid name to continue"
      create_user
    else
      user_setup(name)
    end
  end

  def display_current_scenario
    if @user.energy <= 0
     @user.save
     @current_scenario = @story.last
    end
    if @current_scenario == @story.find { |scenario| scenario[:id] == 157 || scenario[:id] == 170 }
      @user.save
      return "GG"
    end
    # if @current_scenario == @story.find { |scenario| scenario[:id] == 5 } && @user.knowledge <= 50
    #   @current_scenario = @story.find { |scenario| scenario[:id] == 360}
    # end
    puts "                              "
    puts "Your current stats are " + Rainbow("#{@user.knowledge} knowledge").color(:deepskyblue) + ", " + Rainbow("#{@user.stress} stress").color(:webmaroon).bright + " and" + Rainbow(" #{@user.energy} energy ").color(:greenyellow)
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
