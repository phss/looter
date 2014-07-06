
class Game(object):

  def __init__(self, renderer):
    self.renderer = renderer

  def play(self):
    # Main loop:
    # - Render screen
    self.renderer.banner("LOOTER")

    # - Capture input
    # - Update state

