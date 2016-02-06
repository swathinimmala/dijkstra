class Dijkstra
  def initialize(matrix, src)
  	@matrix = matrix
  	@src = src
  	@max= (matrix.flatten.max) + 999
  	@v=matrix.size
  end

  def set_max_distance
  	0.upto(@v-1) do |i|
			0.upto(@v-1) do |j|
				if @matrix[i][j] == 0
					@matrix[i][j] = @max
				end
			end
		end
  end
  
  def calculate_min_distance_node(distance, visited)
  	next_node = 0
  	min = @max
	  0.upto(@v-1) do |c|
	  	if (visited[c] == false) && (min > distance[c])
	  		min = distance[c]
	  		next_node = c
	  	end
	  end
	  return min, next_node
  end

  def set_default_values
  	distance = @matrix[@src]
  	distance[@src] = 0
  	visited = Array.new(@v) {|i| i=false }
  	visited[@src] = true
  	return distance, visited
  end
  
  def dijkstra
  	set_max_distance # where no path is available set value to @max
  	distance, visited = set_default_values
  	
  	next_node = @src
  	0.upto(@v-1) do |i|
  	  min, next_node = calculate_min_distance_node(distance, visited) # find the next node with minimum value
  	  visited[next_node] = true # mark the node visited
  	  0.upto(@v-1) do |j|
  	  	if (visited[j] == false)
  	  		min_distance = min + @matrix[next_node][j]
  	  	  if (min_distance < distance[j])
  	  		  distance[j] = min_distance
  	  		end
  	  	end
  	  end
  	end
    distance.each_with_index {|d,i| puts "Vertex #{i+1}   Distance  #{d}" }
    return distance
  end
end

# sample data from wikipedia
# matrix = [
#     [0, 7, 9, 0, 0, 14],
#     [7, 0, 10, 15, 0, 0],
#     [9, 10, 0, 11, 0, 2],
#     [0, 15, 11, 0, 6, 0],
#     [0, 0, 0, 6, 0, 9],
#     [14, 0, 2, 0, 9, 0]
#     ]
 
# d  = Dijkstra.new(matrix, 1)
# d.dijkstra
# rspec --color --format documentation spec/dijkstra_spec.rb