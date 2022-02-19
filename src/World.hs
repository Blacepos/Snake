module World ( World ( .. )
             , GameState ( .. )
             , initialWorld
             , gridSize
             , screenSize
             , pixelSize
             ) where

import System.Random
import GameData

screenSize :: Int
screenSize = 400

-- Number of grid spaces in either direction
gridSize :: Int
gridSize = 25

pixelSize :: Float
pixelSize = fromIntegral screenSize / fromIntegral gridSize

initialWorld = World { foodPosition = (rx, ry)
                     , snake = [(gridSize `div` 2, gridSize `div` 2)]
                     , direction = DirNone
                     , state = Start
                     , foodRandSeed = 0
                     }
                     where rx = fst $ randomR (0,gridSize-1) (mkStdGen 0)
                           ry = fst $ randomR (0,gridSize-1) (mkStdGen 1)
