module Stories

  class ForrestScenarioRunner < Test::Unit::UI::Console::TestRunner
    def test_finished(name)
      @scenario_name = name.split("(")[0].gsub(/^test_/, "").humanize
      puts "SCENARIO: #{@scenario_name.inspect}"
      set_story
      set_scenario
    end

    def add_fault(fault)
      @faults << fault
    end

    def set_story
      s      ||= Story.new @suite.name
      puts "NAME: #{@suite.name.inspect}"
      @story ||= Stories.all[GeolocationStoriesTest::TestAsAnOrganizationIWantToManageGeolocationSubscriptionsThroughTheCSAPI]
      puts @story.scenarios.last.inspect
    end

    def set_scenario
      @scenario = @story.scenarios.find{|sc| sc.name == @scenario_name}
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
      puts "    #{@scenario.name}"

      unless @scenario.steps.empty? && @scenario.assertions.empty?
        print_scenario @scenario
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
