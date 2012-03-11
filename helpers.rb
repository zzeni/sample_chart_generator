require 'googlecharts'

DATA_DIR = 'public/data'

def generate_chart(filename)
  data = YAML.load_file("#{DATA_DIR}/#{filename}.yml").values
  
  Gchart.line( 
    :size => '800x200',
    :title => "example title",
    :theme => :thirty7signals,
    :data => data, 
    :line_colors => 'e0440e,e62ae5,287eec',
    :legend => ['courbe 1','courbe 2','courbe 3'],
    :axis_with_labels => ['x', 'y'], 
    :axis_range => [[0,100,20], [0,20,5]]
  )
end

