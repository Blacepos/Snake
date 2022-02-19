module GameData where

data Direction = DirUp | DirLeft | DirDown | DirRight | DirNone
    deriving (Eq)

-- All data pertaining to the world
data World = World { foodPosition :: (Int, Int)
                   , snake :: [(Int, Int)]
                   , direction :: Direction
                   , state :: GameState
                   , foodRandSeed :: Int
                   }

data GameState = Start | Alive | Dead