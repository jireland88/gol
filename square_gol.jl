function print_grid(grid, n)
    topline = "|"
    for i in 1:n
        topline = string(topline, "---")
    end
    topline = string(topline, "|")

    println(topline)
    for y in 1:n
        line = "|"
        for x in 1:n
            cell = grid[x, y]

            if cell == 0
                line = string(line, "   ")
            elseif cell == 1
                line = string(line, " + ")
            end
        end
        line = string(line, "|")
        println(line)
    end
    println(topline)
end

function count_neighbours(grid, x, y, n)
    count = 0
    for dy in -1:1
        for dx in -1:1
            if x + dx > 0 && x + dx <= n && y + dy > 0 && y + dy <= n && (dx != 0 || dy != 0)
                if grid[x+dx, y+dy] == 1
                    count = count + 1
                end
            end
        end
    end
    return count
end


function update_grid(grid, n)
    new_grid = zeros(n, n)

    for y in 1:n
        for x in 1:n
            neighbours = count_neighbours(grid, x, y, n)

            if grid[x,y] == 1 && (neighbours == 2 || neighbours == 3)
                new_grid[x,y] = 1
            elseif grid[x,y] == 0 && neighbours == 3
                new_grid[x,y] = 1
            else
                new_grid[x,y] = 0
            end
        end
    end
    return new_grid
end

function clear()
    println()
    println()
    println()
end

function run_gol(n, iter, initial_grid)
    grid = initial_grid
    for i in 1:iter
        clear()
        print_grid(grid, n)
        grid = update_grid(grid, n)
        sleep(0.5)
    end
end


initial_grid = rand([0, 1], 10, 10)
run_gol(10, 20, initial_grid)
