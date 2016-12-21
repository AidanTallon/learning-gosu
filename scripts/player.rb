class Player

  def initialize(x, y)
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
      @x += 1 * speed_mod
    elsif @move_x < 0
      @move_x += 1
      @x -= 1 * speed_mod
    end
    if @move_y > 0
      @move_y -= 1
      @y += 1 * speed_mod
    elsif @move_y < 0
      @move_y += 1
      @y -= 1 * speed_mod
    end
    if @move_x == 0 and @move_y == 0
      @sprite = get_sprite :stand
    end
  end

  def draw
    frame = Gosu::milliseconds / 100 % @sprite.length
    @sprite[frame].draw @x, @y, 5
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
