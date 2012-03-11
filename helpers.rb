require 'googlecharts'

def generate_chart(filename)

#  f = File.new(filename)
  
  Gchart.line( 
    :size => '1000x300',
    :title => "example title",
    :theme => :thirty7signals,
    :data => [[17, 17, 11, 8, 2],[10, 20, 15, 5, 7],[2, 3, 7, 9, 12]], 
    :line_colors => 'e0440e,e62ae5,287eec',
    :legend => ['courbe 1','courbe 2','courbe 3'],
    :axis_with_labels => ['x', 'y'], 
    :axis_range => [[0,100,20], [0,20,5]]
  )

end

