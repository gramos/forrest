require File.join(File.dirname(__FILE__), '../extensions/test/unit/error')

module Stories

  class ScenarioNotFound < StandardError;  end

  class ForrestScenarioRunner < Test::Unit::UI::Console::TestRunner

    def test_finished(name)
      @scenario_name = name.split("(")[0].gsub(/^test_/, "").humanize
      @story_name    = name.split("(")[1].gsub(/\)$/, "")
      set_story
      set_scenario
    end

    def add_fault(fault)
      @faults << fault
    end

    def set_story
      s      ||= Story.new @suite.name
      @story ||= Stories.all[@story_name.constantize]
    end

    def set_scenario
      @scenario = @story.scenarios.find{|sc| sc.name == @scenario_name}
      if @scenario.nil?
        @scenario = @story.scenarios.find{|sc| sc.name == @scenario_name.downcase}
      end
      if @scenario.nil?
        raise  ScenarioNotFound, "\n#{@scenario_name} not found in #{@story.scenarios.inspect}"
      end
    end

    def print_scenario
      @scenario.steps.each do |step|
        puts "      #{step}"
      end

      @scenario.assertions.each do |assertion|
        puts "      #{assertion}"
      end

      puts
    end

    def print_story
      puts "=" * 80
      puts "\n- #{colorize(@story.name, :bold)} \n\n"

      if @faults.empty?
        puts "    #{colorize(@scenario.name, :green)}"
      else
        puts "    #{colorize(@scenario.name, :red)}"
      end

      unless @scenario.steps.empty? && @scenario.assertions.empty?
        print_scenario
      end

      puts "=" * 80
    end

    def finished(elapsed_time)
      puts

      print_story
      super
    end

  end

end
