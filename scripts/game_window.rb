class GameWindow < Gosu::Window

  def initialize
    super 640, 480, false
    self.caption = 'Platformer Game'
    @scene = SceneMap.new self
  end

  def update
    @scene.update
  end

  def draw
    @scene.draw
  end

  def button_down(id)
    close if id == Gosu::KbEscape
    @scene.button_down id
  end

  def button_up(id)
    @scene.button_up id
  end

end
