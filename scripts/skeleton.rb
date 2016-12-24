class Skeleton

  def initialize(scene, x, y)
    @scene = scene
    @x = x
    @y = y
    @move_x = 0
    @move_y = 0
    load_sprites
    @sprite = get_sprite :stand
    @wander_x = 0
    @wander_y = 0
    @wandering = 0
  end

  def find_path_to x, y
    target_tile = [x / 16, y / 16]
    current_tile = [@x / 16, @y / 16]

    # co_ords is an array of all moveable tiles with a counter indicating distance from target
    co_ords = []
    # initialize with the target tile
    co_ords << [target_tile, 0]
    # iterate through co_ords. new tiles will be added as the iteration continues
    co_ords.each do |tile|
      # tiles to the tile being iterated on
      check_tiles = [
                      [tile[0][0] + 1, tile[0][1]],
                      [tile[0][0] - 1, tile[0][1]],
                      [tile[0][0],     tile[0][1] + 1],
                      [tile[0][0],     tile[0][1] - 1],
                    ]
      check_tiles.each do |check_tile|
        # Check if the tile can be moved to
        if @scene.can_move_to? check_tile[0] * 16, check_tile[1] * 16
          should_add = true
          # check if tile is already in array, and whether a quicker route has been found
          # TODO: maybe can be more efficent?
          co_ords.map do |x|
            if x[0] == check_tile and x[1] <= tile[1] + 1
              # A quicker route already exists, so do not add
              should_add = false
              break
            elsif x[0] == check_tile and x[1] > tile[1] + 1
              # A slower route exists, so delete it and override in a bit
              co_ords.delete x
              break
            end
          end
          # Add check_tile if route is quicker or previously didn't exist
          co_ords << [check_tile, tile[1] + 1] if should_add
        end
      end
      # Break when 100 tiles have been checked. TODO: break when certain conditions are met
      break if co_ords.length > 100
    end
    path_found = false
    # Check that a path exists
    co_ords.each do |x|
      if x[0] == current_tile
        path_found = true
        break
      end
    end
    # Return nil if not path found. This is used when the method is called so the skeleton knows not to move
    return nil unless path_found
    if path_found
      # tiles adjacent to current position
      move_tiles = [
                      [current_tile[0] + 1, current_tile[1]],
                      [current_tile[0] - 1, current_tile[1]],
                      [current_tile[0],     current_tile[1] + 1],
                      [current_tile[0],     current_tile[1] - 1]
                    ]
      # move_options contains a reference to available co_ords entries
      move_options = []
      co_ords.each do |x|
        if move_tiles.include? x[0]
          move_options[x[1]] = x[0]
        end
      end
      tile = []
      # What does this do? Does it just take any move_tile?
      move_options.each do |x|
        if x != nil
          tile = x
          break
        end
      end
      # return direction to move
      case tile
      when move_tiles[0]
        return :right
      when move_tiles[1]
        return :left
      when move_tiles[2]
        return :down
      when move_tiles[3]
        return :up
      end
    end
  end

  def wander
    if @wandering <= 0
      @wandering = 20
      dir = [:up, :right, nil].sample
      if dir == :up
        @wander_y= [20, -20].sample
      elsif dir == :right
        @wander_x = [20, -20].sample
      end
    end
    if @wander_x > 0
      @wander_x -= 1
      move :right
    elsif @wander_x < 0
      @wander_x += 1
      move :left
    end
    if @wander_y > 0
      @wander_y -= 1
      move :up
    elsif @wander_y < 0
      @wander_y += 1
      move :down
    end
    @wandering -= 1
  end

  def update
    dir = find_path_to @scene.player.x, @scene.player.y
    if dir
      move dir
    else
      wander
    end
    if @move_x > 0
      @move_x -= 1
      new_x_pos = [(@x + (1 * speed_mod)), ($window.width - 8)].min
      @x = new_x_pos if @scene.can_move_to? new_x_pos + 8, @y
    elsif @move_x < 0
      @move_x += 1
      new_x_pos = [(@x - (1 * speed_mod)), (0 + 8)].max
      @x = new_x_pos if @scene.can_move_to? new_x_pos - 8, @y
    end
    if @move_y > 0
      @move_y -= 1
      new_y_pos = [(@y + (1 * speed_mod)), ($window.height - 8)].min
      @y = new_y_pos if @scene.can_move_to? @x, new_y_pos + 8
    elsif @move_y < 0
      @move_y += 1
      new_y_pos = [(@y - (1 * speed_mod)), (0 + 8)].max
      @y = new_y_pos if @scene.can_move_to? @x, new_y_pos - 8
    end
    if @move_x == 0 and @move_y == 0
      @sprite = get_sprite :stand
    end
  end

  def draw
    frame = Gosu::milliseconds / 100 % @sprite.length
    @sprite[frame].draw_rot @x, @y, 5, 1
  end

  def load_sprites
    @stand = Gosu::Image.load_tiles 'graphics/sprites/characters/stand_03.png', 16, 16
    @walk_left = Gosu::Image.load_tiles 'graphics/sprites/characters/walk_07.png', 16, 16
    @walk_right = Gosu::Image.load_tiles 'graphics/sprites/characters/walk_11.png', 16, 16
    @walk_up = Gosu::Image.load_tiles 'graphics/sprites/characters/walk_15.png', 16, 16
    @walk_down = Gosu::Image.load_tiles 'graphics/sprites/characters/walk_03.png', 16, 16
  end

  def get_sprite(spr)
    case spr
    when :stand
      return @stand
    when :walk_left
      return @walk_left
    when :walk_right
      return @walk_right
    when :walk_up
      return @walk_up
    when :walk_down
      return @walk_down
    end
  end

  def move(dir)
    if dir == :left
      @move_x = -3
      @sprite = get_sprite :walk_left
    elsif dir == :right
      @move_x = +3
      @sprite = get_sprite :walk_right
    elsif dir == :up
      @move_y = -3
      @sprite = get_sprite :walk_up
    elsif dir == :down
      @move_y = +3
      @sprite = get_sprite :walk_down
    end
  end

  def speed_mod
    return 1
  end
end
