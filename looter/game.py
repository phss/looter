
class Game(object):

  def __init__(self, display):
    self.display = display

  def play(self):
    self.display.banner("LOOTER")

class ShellDisplay(object):

  def banner(self, text):
    print text
    

