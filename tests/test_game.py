from mock import MagicMock
from looter.game import Game

class TestGame(object):

  def test_renders_banner(self):
    mock_display = MagicMock()
    
    Game(mock_display).play()

    mock_display.banner.assert_called_with("LOOTER")

