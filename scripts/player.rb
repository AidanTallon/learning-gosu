class Player

  def initialize(scene, x, y)
    @scene = scene
    @x = x
    @y = y
    @move_x = 0
    @move_y = 0
    load_sprites
    @sprite = get_sprite :stand
  end

  def update
    move :left if $window.button_down? Gosu::KbLeft
    move :right if $window.button_down? Gosu::KbRight
    move :up if $window.button_down? Gosu::KbUp
    move :down if $window.button_down? Gosu::KbDown
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
    @stand = Gosu::Image.load_tiles('graphics/sprites/characters/stand_02.png', 16, 16)
    @walk_left = Gosu::Image.load_tiles('graphics/sprites/characters/walk_06.png', 16, 16)
    @walk_right = Gosu::Image.load_tiles('graphics/sprites/characters/walk_10.png', 16, 16)
    @walk_up = Gosu::Image.load_tiles('graphics/sprites/characters/walk_14.png', 16, 16)
    @walk_down = Gosu::Image.load_tiles('graphics/sprites/characters/walk_02.png', 16, 16)
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

  def interact
    if @scene.interactive_adjacent? @x, @y
      @scene.interact_with_adjacent @x, @y
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
    if $window.button_down? Gosu::KbLeftControl
      return 2
    else
      return 1
    end
  end
end
