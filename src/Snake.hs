module Snake
     ( entryPoint
     ) where

import Graphics.Gloss
import System.Random

import World
import Draw
import Controls
import Update
import Util

entryPoint :: IO ()
entryPoint = do gen <- getStdGen
                let seed = fst $ random gen
                play (InWindow "Snake!" (screenSize, screenSize) (0, 0))
                     (makeColor 0 0 0 1)
                     10
                     (initialWorld seed)
                     (topLeft . draw)
                     input
                     update
