require 'pry'

class CLI
  def initialize
    @prompt = TTY::Prompt.new
    @user = nil
    @story = [
      {
        id: 1,
        description: 'You wake up in the morning, first day of school...',
        choices: [
          { choice: 2, text: 'Hit snooze.'},
          { choice: 3, text: 'Get up.'},
        ],
      },
      {
        id: 2,
        description: "You're late!!!",
        choices: [
          { choice: 4, text: 'Take the train.'},
          { choice: 4, text: 'Cycle.'},
          { choice: 4, text: 'Run.'},
        ],
      },
      {
        id: 3,
        description: 'You wake up nice and early, and enjoy a healthy breakfast!',
        choices: [
          { choice: 4, text: 'Walk'},
          { choice: 4, text: 'Get the tube.'},
        ]
      },
      {
        id: 4,
        description: 'You get to school!',
        choices: [
          { choice: 1, text: 'Nice'},
          { choice: 1, text: 'Awesome!'},
        ]
      },
    ]
    @current_scenario = @story[0]
  end

  def create_user
    name = @prompt.ask("What's your name?")
    @user = User.create(name: name)
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

  # def show_options
  # end
  #
  # def display_scenario
  #   display_current_scenario
  #   # how_options
  # end
  #
  # def start
  #   display_scenario
  # end

  def run
    create_user
    display_current_scenario
  end
end
