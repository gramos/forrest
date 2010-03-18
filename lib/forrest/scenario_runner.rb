module Test
  module Unit
    class Error
      # Returns a verbose version of the error description.

      def long_display
        backtrace = filter_backtrace(@exception.backtrace).join("\n    ")
        "#{colorize('Error:', :red)}\n #{colorize(filter_rails_html(message), :red)}\n#{backtrace}"
      end

      def filter_rails_html(str)
        html = '<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Action Controller: Exception caught</title>
  <style>
    body { background-color: #fff; color: #333; }

    body, p, ol, ul, td {
      font-family: verdana, arial, helvetica, sans-serif;
      font-size:   13px;
      line-height: 18px;
    }

    pre {
      background-color: #eee;
      padding: 10px;
      font-size: 11px;
    }

    a { color: #000; }
    a:visited { color: #666; }
    a:hover { color: #fff; background-color:#000; }
  </style>
</head>
<body>

<h1>'
      out = str.gsub(html, '')
      out.split("\n")[0, 6].join("\n") + "..."
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
