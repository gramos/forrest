module Test
  module Unit
    class Error
      # Returns a verbose version of the error description.

      def long_display
        backtrace = filter_backtrace(@exception.backtrace).join("\n    ")
        "#{colorize('Error:', :red)}\n" +
        "#{colorize(filter_rails_html(message), :red)}\n#{backtrace}"
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
