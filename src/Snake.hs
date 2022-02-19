module Snake
     ( entryPoint
     ) where

import Graphics.Gloss

import World
import Draw
import Controls
import Update

entryPoint :: IO ()
entryPoint = play (InWindow "Snake!" (screenSize, screenSize) (0, 0))
                  (makeColor 0 0 0 1)
                  10
                  initialWorld
                  (topLeft . draw)
                  input
                  update

topLeft :: Picture -> Picture
topLeft = Translate (fromIntegral (-screenSize) / 2.0) (fromIntegral screenSize / 2.0) . Scale 1.0 (-1.0)