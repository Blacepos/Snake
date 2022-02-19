module Snake
     ( entryPoint
     ) where

import Graphics.Gloss

import World
import Draw
import Controls
import Update
import Util

entryPoint :: IO ()
entryPoint = play (InWindow "Snake!" (screenSize, screenSize) (0, 0))
                  (makeColor 0 0 0 1)
                  10
                  initialWorld
                  (topLeft . draw)
                  input
                  update
