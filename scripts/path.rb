class Path
  attr_accessor :path_map


  def initialize(level, target_tile)
    @path_map = generate_path_map level, target_tile
  end

  def generate_path_map(level, target_tile)
    
  end

end
