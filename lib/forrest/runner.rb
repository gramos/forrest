module Stories

  class ForrestRunner < Test::Unit::UI::Console::TestRunner
    def test_finished(name)
      set_story
    end

    def add_fault(fault)
      @faults << fault
    end

    def set_story
      s      ||= Story.new @suite.name
      @story ||= Stories.all[s.name.constantize]
    end

    def print_scenario(scenario)
      scenario.steps.each do |step|
        puts "      #{step}"
      end

      scenario.assertions.each do |assertion|
        puts "      #{assertion}"
      end

      puts
    end

    def print_story
      puts "- #{colorize(@story.name, :bold)} \n\n"

      @story.scenarios.each do |scenario|
        puts "    #{scenario.name}"

        unless scenario.steps.empty? && scenario.assertions.empty?
          print_scenario scenario
        end
      end
    end

    def finished(elapsed_time)
      puts
      print_story
      super
      stories_count   = 1
      scenarios_count = @story.scenarios.size

      puts colorize("#{stories_count} story, ", :bold) +
           colorize(" #{scenarios_count} scenarios", :bold)

    end
  end

end
