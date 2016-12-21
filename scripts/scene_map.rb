class SceneMap

  def initialize
    @player = Player.new 240, 240
  end

  def update
    @player.update
  end

  def draw
    @player.draw
  end

  def button_down(id)
  end

  def button_up(id)
  end
end
