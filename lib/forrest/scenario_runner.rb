module Test
  module Unit
    class Error
      # Returns a verbose version of the error description.

      def long_display
        backtrace = filter_backtrace(@exception.backtrace).join("\n    ")
        "#{colorize('Error:', :red)}\n #{colorize(message, :red)}\n#{backtrace}"
      end

    end
  end
end

module Stories

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
