class SceneMap

  def initialize(window)
    @player = Player.new self, (17 * 16) + 8, (9 * 16) + 8
    basic_tiles_2 = Gosu::Image.load_tiles window, 'graphics/sprites/environment/basic_tiles_2.png', 16, 16, true
    things_0 = Gosu::Image.load_tiles window, 'graphics/sprites/environment/things_0.png', 16, 16, true
    @tileset = basic_tiles_2 + things_0

    # Map layout
    @level = []
    @level[0]   = [ 11,  11,  11,  64,  64,  11,  11,  11,  11,  11,  11,  64,  11,  11,  11,  11,  11,  11,  11,  64,  64,  65,  64,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  64,  65,  65]
    @level[1]   = [ 11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11]
    @level[2]   = [ 11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11]
    @level[3]   = [ 11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  64,  64,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  64,  11,  11,  11,  11,  11,  11,  11,  11,  11]
    @level[4]   = [ 11,  11,  11,  11,  11,  64,  64,  11,  11,  11,  11,  11,  11,  11,  64,   7,   6,   6,   6,   7,  11,  11,  11,  11,  11,  11,  11,  11,  64,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11]
    @level[5]   = [ 11,  11,  11,  11,  11,  64,  64,  11,  11,  11,  64,  11,  11,  11,  11,   5,   8,   8,   8,   5,  64,  11,  11,  11,  11,  11,  11,  64,  11,  11,  11,  11,  11,  11,  11,  11,  10,  10,  10,  10]
    @level[6]   = [ 11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,   5,   8,   8,   8,   5,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  10,  10,  10,  10]
    @level[7]   = [ 11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,   5,   8,   8,   8,   5,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  10,  10,  11,  11]
    @level[8]   = [ 11,  64,  64,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,   6,   6, :i0,   6,   6,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  10,  10,  11,  11]
    @level[9]   = [ 10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  11,  11]
    @level[10]  = [ 10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  10,  11,  11]
    @level[11]  = [ 64,  64,  11,  11,  11,  11,  11,  64,  65,  65,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  64,  64,  11,  11,  11,   3,   2, :i1,   2,   3,  11,  11,  11,  11,  11,  11,  11,  11]
    @level[12]  = [ 11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,   1,   8,   8,   8,   1,  11,  11,  11,  11,  11,  11,  11,  11]
    @level[13]  = [ 11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,   1,   8,   8,   8,   1,  11,  11,  11,  11,  11,  64,  11,  11]
    @level[14]  = [ 11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,   1,   8,   8,   8,   1,  11,  11,  11,  11,  11,  64,  11,  11]
    @level[15]  = [ 11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  64,   2,   2,   2,   2,   2,  11,  11,  11,  11,  64,  64,  11,  11]
    @level[16]  = [ 11,  11,  11,  11,  11,  11,  11,  11,  11,  64,  11,  11,  11,  11,  11,  11,  64,  11,  11,  11,  11,  11,  11,  11,  11,  11,  64,  11,  11,  11,  65,  64,  11,  11,  11,  11,  11,  11,  11,  11]
    @level[17]  = [ 11,  64,  11,  11,  11,  11,  11,  64,  11,  11,  11,  11,  11,  11,  64,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11]
    @level[18]  = [ 11,  11,  11,  11,  11,  11,  64,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  64,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11]
    @level[19]  = [ 11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11]
    @level[20]  = [ 11,  11,  64,  11,  11,  11,  11,  11,  11,  11,  64,  65,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11]
    @level[21]  = [ 11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  64,  64,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11]
    @level[22]  = [ 11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  64,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11]
    @level[23]  = [ 11,  64,  11,  11,  11,  11,  64,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11]
    @level[24]  = [ 11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  64,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  64,  11,  11,  11,  11,  11,  11,  64,  64,  11,  11,  11,  64,  11,  11,  11,  11]
    @level[25]  = [ 11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  64,  11,  11,  11,  11,  11,  11,  11,  11]
    @level[26]  = [ 64,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  64,  11,  11,  11,  64,  11,  64,  11,  11,  11]
    @level[27]  = [ 11,  64,  11,  11,  64,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11]
    @level[28]  = [ 11,  64,  11,  65,  11,  64,  64,  11,  64,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  64,  11,  11,  11,  11,  64,  11,  11,  11,  11,  11,  11,  11,  11]
    @level[29]  = [ 64,  11,  65,  65,  11,  64,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11,  11]


    @layer_2 = []
    @layer_2[0] =  [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[1] =  [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[2] =  [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[3] =  [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[4] =  [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[5] =  [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, :a0, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[6] =  [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[7] =  [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[8] =  [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[9] =  [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[10] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[11] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[12] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[13] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[14] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[15] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[16] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[17] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[18] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[19] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[20] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[21] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[22] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[23] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[24] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[25] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[26] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[27] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[28] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @layer_2[29] = [ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]

    # Interactive elements
    @interactive_elements = {
      i0: {
            id: 0,
            pos: [8, 17],
            description: 'Player house door',
            type: :door,
            state: :closed
          },
      i1: {
            id: 1,
            pos: [11, 29],
            description: 'Other house door',
            type: :door,
            state: :closed
          }
    }

    # Animated elements
    @animated_elements = {
      a0: {
        description: 'Torch',
        sprites: [60, 61],
        type: :torch
      }
    }
  end

  def update
    @player.update
  end

  def draw
    @player.draw
    @level.each_with_index do |x, x_row|
      x.each_with_index do |y, y_row|
        get_tile(y).draw y_row * 16, x_row * 16, 1
      end
    end
    @layer_2.each_with_index do |x, x_row|
      x.each_with_index do |y, y_row|
        get_tile(y).draw y_row * 16, x_row * 16, 1 if y != nil
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
    if blocker_tile? @level[y_row][x_row] or blocker_tile? @layer_2[y_row][x_row]
      return false
    else
      return true
    end
  end

  def blocker_tile?(tile_id)
    blockers = [0, 1, 2, 3, 4, 5, 6, 7, 14, 15, 22, 23, 24, 25, 26, 27, 30, 31, 32, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 52, 54, 55, 56, 60, 61, 62, 63, 68, 69, 70, 71, 72, 77, 78, 79, 80, 92, 93, 100]
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
