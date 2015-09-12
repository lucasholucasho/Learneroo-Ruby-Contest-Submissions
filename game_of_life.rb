def game_of_life(grid)
  execution_count = 0
  grid_to_move_on = grid
  while execution_count < 15
    new_grid = Array.new(grid.size) { Array.new (grid.size)}
    grid_to_move_on.each_with_index do |x, xi|
      x.each_with_index do |y, yi|
        alive_neighbors = 0
        if yi != 0 #look at left neighbor
          if grid_to_move_on[xi][yi-1] == 1
            alive_neighbors = alive_neighbors + 1
          end
        end
        
        if yi != 0 and xi != 0 #look at above left neighbor
          if grid_to_move_on[xi-1][yi-1] == 1
            alive_neighbors = alive_neighbors + 1
          end
        end
        
        if xi != 0 #look at above neighbor
          if grid_to_move_on[xi-1][yi] == 1
            alive_neighbors = alive_neighbors + 1
          end
        end
        
        if xi != 0 and yi != (grid.size - 1) #look at above right neighbor
          if grid_to_move_on[xi-1][yi+1] == 1
            alive_neighbors = alive_neighbors + 1
          end
        end
        
        if yi != (grid.size - 1) #look at right neighbor
          if grid_to_move_on[xi][yi+1] == 1
            alive_neighbors = alive_neighbors + 1
          end
        end
        
        if xi != (grid.size - 1) and yi != (grid.size - 1) #look at below right neighbor
          if grid_to_move_on[xi+1][yi+1] == 1
            alive_neighbors = alive_neighbors + 1
          end
        end
        
        if xi != (grid.size - 1) #look at below neighbor
          if grid_to_move_on[xi+1][yi] == 1
            alive_neighbors = alive_neighbors + 1
          end
        end
        
        if xi != (grid.size - 1) and yi != 0 #look at below left neighbor
          if grid_to_move_on[xi+1][yi-1] == 1
            alive_neighbors = alive_neighbors + 1
          end
        end
      
        if y == 0
          if alive_neighbors == 3
            new_grid[xi][yi] = 1
          else
            new_grid[xi][yi] = 0
          end
        elsif y == 1
          if alive_neighbors < 2 or alive_neighbors > 3
            new_grid[xi][yi] = 0
          else
            new_grid[xi][yi] = 1
          end
        end
      end
    end
    print_board(new_grid)
    execution_count = execution_count + 1
    grid_to_move_on = new_grid
  end
end

# helper method
def print_board(grid)
    grid.each do |row|
    	print row.join('')
    	puts
    end
    puts '~'
end

#boilerplate code
t = gets.to_i
for c in 1..t do
	m = gets.to_i
	grid = []
	(0...m).each do |r|
		grid[r] = gets.strip.split.map {|i| i.to_i}
	end
	game_of_life(grid)
end