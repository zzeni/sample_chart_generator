require 'googlecharts'

DATA_DIR = 'public/data'

def generate_chart(filename, type = 'line')
  data = YAML.load_file("#{DATA_DIR}/#{filename}.yml").values

  chart_params = {
    :size => '800x200',
    :title => "example title",
    :theme => :thirty7signals,
    :data => data,
    :line_colors => 'e0440e,e62ae5,287eec',
    :legend => ['courbe 1','courbe 2','courbe 3'],
    :axis_with_labels => ['x', 'y'],
    :axis_range => [[0,100,20], [0,20,5]]
  }

  case type
    when 'line'
      Gchart.line(chart_params)
    when 'pie'
      Gchart.pie(chart_params)
    when 'bar'
      Gchart.bar(chart_params)
    else
      throw(:halt, [400, "Bad Request!\n"])
  end
end

def protected!
  unless authorized?
    response['WWW-Authenticate'] = %(Basic realm="Restricted Area")
    throw(:halt, [401, "Not authorized\n"])
  end
end

def authorized?
  @auth ||=  Rack::Auth::Basic::Request.new(request.env)
  @auth.provided? &&
    @auth.basic? &&
    @auth.credentials &&
    @auth.credentials == [APP_ADMIN_USERNAME, APP_ADMIN_PASSWORD]
end

