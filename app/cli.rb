require 'pry'

class CLI
  def initialize
    @prompt = TTY::Prompt.new
    @user = nil
    @occupation = nil
    @story = [
      { #Start day 1
        id: 1,
        description: "Good morning #{self.name}. You've just woken up for your first day at flatiron school. Do you want to get up early and have a healthy breakfest or go back to sleep?"
        choices: [
          { choice: 2, text: 'Hit snooze.'},
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
        ]
      },
      {
        id: 5,
        description: 'You arrive at school eager and ready to learn. You notice that everyone else is seated. Looking around people have split into two distinct groups, who do you want to sit with?',
        choices: [
          { choice: 6, text: 'The nerds?'},
          { choice: 7, text: 'The cool group!'},
        ]
      },
      {
        id: 6,
        description: 'You sit with the nerds (You look like you fit right in), you mingle a bit and get straight to work. You hear labs are coming up soon, do you want a coffe first?',
        choices: [
          { choice: 8, text: 'Coffee, coffee, coffee!'},
          { choice: 9, text: 'Straight to the labs'},
        ]
      },
      {
        id: 7,
        description: 'You sit down in the cool group, they continue to laugh and joke along with you, you waste a few hours screwing around, but make some friends. You hear labs are coming up soon, do you want a coffe first?',
        choices: [
          { choice: 8, text: 'Coffee, coffee, coffee!'},
          { choice: 9, text: 'Straight to the labs'},
        ]
      },
      {
        id: 8,
        description: "The coffee here taste's great, better than that crap you get from 'popular coffee franchise, you know the one' you eagerly take on the labs",
        choices: [
          { choice: 9, text: 'Take on the labs!'},
        ]
      },
      {
        id: 9, #Kind of plain without a battle encounter
        description: "You take on the labs, they've realised 81 on the first day. How is this fair?",
        choices: [
          { choice: 10, text: 'You move onto lunch'},
        ]
      },
      {
        id: 10,
        description: "Rewarding yourself with a nice lunch after all of those labs, youve been invited to mediatate or play the campus game Cambio",
        choices: [
          { choice: 11, text: 'Meditate'},
          { choice: 11, text: 'Ill try out cambio'},
        ]
      },
      {
        id: 11,
        description: "After you're done you head home and rest",
        choices: [
          { choice: 12, text: 'start of day 2 here'},
          { choice: 13, text: 'start of day 2 here'},
        ]
      },
      { #Start day 3
        id: 0,
        description: "You wake up in a dream like state, you didnt sleep well. You make your way to the station"
        choices: [
          { choice: 2, text: 'Hit snooze.'},
          { choice: 3, text: 'Get up.'},
        ],
      },
      {
        id: 2,
        description: "",
        choices: [
          { choice: 5, text: 'Take the train.'},
          { choice: 5, text: 'Cycle.'},
          { choice: 5, text: 'Run.'},
        ],
      },
      {
        id: 3,
        description: "ol?",
        choices: [
          { choice: 5, text: 'Walk'},
          { choice: 5, text: 'Get the tube.'},
        ]
      },
      {
        id: 5,
        description: 'jh?',
        choices: [
          { choice: 6, text: 'The nerds?'},
          { choice: 7, text: 'The cool group!'},
        ]
      },
      {
        id: 6,
        description: 'hst?',
        choices: [
          { choice: 8, text: 'Coffee, coffee, coffee!'},
          { choice: 9, text: 'Straight to the labs'},
        ]
      },
      {
        id: 7,
        description: 'hrst?',
        choices: [
          { choice: 8, text: 'Coffee, coffee, coffee!'},
          { choice: 9, text: 'Straight to the labs'},
        ]
      },
      {
        id: 8,
        description: "hhh",
        choices: [
          { choice: 9, text: 'Take on the labs!'},
        ]
      },
      {
        id: 9, #Kind of plain without a battle encounter
        description: "ii",
        choices: [
          { choice: 10, text: 'You move onto lunch'},
        ]
      },
      {
        id: 10,
        description: "h",
        choices: [
          { choice: 11, text: 'Meditate'},
          { choice: 11, text: 'Ill try out cambio'},
        ]
      },
      {
        id: 11,
        description: "h",
        choices: [
          { choice: 12, text: 'start of day 2 here'},
          { choice: 13, text: 'start of day 2 here'},
        ]
      },
    ]
    @current_scenario = @story[0]
  end

  def create_user
    name = @prompt.ask("What's your name?")
    occupation = @prompt.ask("What was your career before coding?")
    @user = User.create(name: name, occupation: occupation)
  end

  def choose_scenario
    choice = @prompt.select("What would you like to do?:")
    @current_scenario = story.find { |scenario| scenario[:id] == choice }
  end

  def display_current_scenario
    puts @current_scenario[:description]
    # puts @current_scenario[:choices]
    next_scenario_id = @prompt.select("Choose your destiny?") do |menu|
      @current_scenario[:choices].each do |choice|
        menu.choice name: choice[:text], value: choice[:choice]
      end
    end
    @current_scenario = @story.find { |scenario| scenario[:id] == next_scenario_id }
    display_current_scenario
  end

  def run
    create_user
    display_current_scenario
  end
end
