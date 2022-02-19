module World ( World ( .. )
             , GameState ( .. )
             , initialWorld
             , gridSize
             , screenSize
             , pixelSize
             ) where

import System.Random

screenSize :: Int
screenSize = 400

-- Number of grid spaces in either direction
gridSize :: Int
gridSize = 25

pixelSize :: Float
pixelSize = fromIntegral screenSize / fromIntegral gridSize

-- All data pertaining to the world
data World = World { foodPosition :: (Int, Int)
                   , snake :: [(Int, Int)]
                   , direction :: Int
                   , state :: GameState
                   , foodRandSeed :: Int
                   }

data GameState = Start | Alive | Dead

initialWorld = World { foodPosition = (rx, ry)
                     , snake = [(gridSize `div` 2, gridSize `div` 2)]
                     , direction = 0
                     , state = Start
                     , foodRandSeed = 0
                     }
                     where rx = fst $ randomR (0,gridSize-1) (mkStdGen 0)
                           ry = fst $ randomR (0,gridSize-1) (mkStdGen 1)

