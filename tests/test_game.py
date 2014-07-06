from mock import MagicMock
from looter.game import Game

class TestGame(object):

  def test_renders_banner(self):
    mock_renderer = MagicMock()
    
    Game(mock_renderer).play()

    mock_renderer.banner.assert_called_with("LOOTER")

