class Skeleton

  def initialize(scene, x, y)
    @scene = scene
    @x = x
    @y = y
    @move_x = 0
    @move_y = 0
    load_sprites
    @sprite = get_sprite :stand
  end

  def find_path_to x, y
    target_tile = [x / 16, y / 16]
    current_tile = [@x / 16, @y / 16]

    co_ords = []
    co_ords << [target_tile, 0]
    co_ords.each do |tile|
      check_tiles = [
                      [tile[0][0] + 1, tile[0][1]],
                      [tile[0][0] - 1, tile[0][1]],
                      [tile[0][0],     tile[0][1] + 1],
                      [tile[0][0],     tile[0][1] - 1],
                    ]
      check_tiles.each do |check_tile|
        if @scene.can_move_to? check_tile[0] * 16, check_tile[1] * 16
          should_add = true
          co_ords.map do |x|
            if x[0] == check_tile and x[1] <= tile[1] + 1
              should_add = false
              break
            elsif x[0] == check_tile and x[1] > tile[1] + 1
              co_ords.delete x
            end
          end
          co_ords << [check_tile, tile[1] + 1] if should_add
        end
      end
      break if co_ords.length > 100
    end
    path_found = false
    co_ords.each do |x|
      if x[0] == current_tile
        path_found = true
        break
      end
    end
    return nil unless path_found
    if path_found
      move_tiles = [
                      [current_tile[0] + 1, current_tile[1]],
                      [current_tile[0] - 1, current_tile[1]],
                      [current_tile[0],     current_tile[1] + 1],
                      [current_tile[0],     current_tile[1] - 1]
                    ]
      move_options = []
      co_ords.each do |x|
        if move_tiles.include? x[0]
          move_options[x[1]] = x[0]
        end
      end
      tile = []
      move_options.each do |x|
        if x != nil
          tile = x
          break
        end
      end
      #binding.pry
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

  def update
    dir = find_path_to @scene.player.x, @scene.player.y
    move dir if dir
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
