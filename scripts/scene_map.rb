class SceneMap

  def initialize(window)
    @player = Player.new self, (17 * 16) + 8, (9 * 16) + 8
    basic_tiles_2 = Gosu::Image.load_tiles window, 'graphics/sprites/environment/basic_tiles_2.png', 16, 16, true
    things_0 = Gosu::Image.load_tiles window, 'graphics/sprites/environment/things_0.png', 16, 16, true
    @tileset = basic_tiles_2 + things_0

    # Map layout
    @level = DemoLevel.level
    # Interactive elements
    @interactive_elements = DemoLevel.interactive_elements
    # Animated elements
    @animated_elements = DemoLevel.animated_elements
  end

  def update
    @player.update
  end

  def draw
    @player.draw
    @level.each do |z|
      z.each_with_index do |y, y_row|
        y.each_with_index do |x, x_row|
          get_tile(x).draw x_row * 16, y_row * 16, 1 if x != nil
        end
      end
    end
  end

  def get_tile(tile)
    if tile.class == Symbol
      if tile.to_s =~ /^i/
        if @interactive_elements[tile][:type] == :door
          return @tileset[48] if @interactive_elements[tile][:state] == :closed
          return @tileset[8] if @interactive_elements[tile][:state] == :open
        end
      elsif tile.to_s =~ /^a/
        frame = Gosu::milliseconds / 100 % @animated_elements[tile][:sprites].length
        @tileset[@animated_elements[tile][:sprites][frame]]
      end
    else
      return @tileset[tile]
    end
  end

  def interactive_adjacent?(x, y)
    @interactive_elements.each do |key, element|
      element_x = (element[:pos][1] * 16) + 8
      element_y = (element[:pos][0] * 16) + 8
      if x - element_x <= 24 and x - element_x >= -24 and y - element_y <= 24 and y - element_y >= -24
        return true
      end
    end
    return false
  end

  def interact_with_adjacent(x, y)
    @interactive_elements.each do |key, element|
      element_x = (element[:pos][1] * 16) + 8
      element_y = (element[:pos][0] * 16) + 8
      if x - element_x <= 24 and x - element_x >= -24 and y - element_y <= 24 and y - element_y >= -24
        interact_with element
      end
    end
  end


  def interact_with(element)
    if element[:type] == :door
      if element[:state] == :closed
        element[:state] = :open
      elsif element[:state] == :open
        element[:state] = :closed
      end
    end
  end

  def can_move_to?(x, y)
    x_row = [x / 16, 39].min
    y_row = [y / 16, 29].min
    @level.each do |z_axis|
      return false if blocker_tile? z_axis[y_row][x_row]
    end
    return true
  end

  def blocker_tile?(tile_id)
    blockers = [0, 1, 2, 3, 4, 5, 6, 7, 14, 15, 22, 23, 24, 25, 26, 27,
                30, 31, 32, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45,
                46, 47, 48, 49, 50, 52, 54, 55, 56, 60, 61, 62, 63, 68,
                69, 70, 71, 72, 77, 78, 79, 80, 92, 93, 100]
    if tile_id.class == Symbol
      if tile_id.to_s =~ /^i/
        if @interactive_elements[tile_id][:type] == :door
          if @interactive_elements[tile_id][:state] == :closed
            return true
          elsif @interactive_elements[tile_id][:state] == :open
            return false
          end
        end
      elsif tile_id.to_s =~ /^a/
        if @animated_elements[tile_id][:type] == :torch
          return true
        end
      end
    end
    if blockers.include? tile_id
      return true
    else
      return false
    end
  end

  def button_down(id)
    if id == Gosu::KbSpace
      @player.interact
    end
  end

  def button_up(id)
  end
end
