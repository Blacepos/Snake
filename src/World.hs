module World ( initialWorld
             , gridSize
             , screenSize
             , pixelSize
             ) where

import System.Random ( mkStdGen, Random(randomR) )
import GameData

screenSize :: Int
screenSize = 400

-- Number of grid spaces in either direction
gridSize :: Int
gridSize = 25

pixelSize :: Float
pixelSize = fromIntegral screenSize / fromIntegral gridSize

initialWorld seed = World { foodPosition = (rx, ry)
                          , snake = [(gridSize `div` 2, gridSize `div` 2)]
                          , direction = DirNone
                          , state = Start
                          , foodRandSeed = seed+2
                          }
                          where rx = fst $ randomR (0,gridSize-1) (mkStdGen seed)
                                ry = fst $ randomR (0,gridSize-1) (mkStdGen (seed+1))
