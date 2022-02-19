module Draw
    ( draw
    ) where

import Graphics.Gloss
import World
import Util
import GameData

-- Convert the current world to a Picture
draw :: World -> Picture
draw World{ foodPosition=foodPosition, snake=snake, state=state }
    = case state of Start -> Pictures [drawSnake snake, drawFood foodPosition]
                    Alive -> Pictures [drawSnake snake, drawFood foodPosition]
                    Dead  -> Color white $ toCenter $ Text "D:"

-- Draw the specified shape at the grid location
drawAt :: Picture -> Point -> Picture
drawAt picture (x, y) = Translate (x*pixelSize) (y*pixelSize) picture

pixelAt :: Color -> Point -> Picture 
pixelAt = drawAt . pixel

pixel :: Color -> Picture
pixel color = Color color $
        Polygon [(w, h), (w, 1), (1, 1), (1, h)]
        where w = pixelSize - 1
              h = pixelSize - 1


drawSnake :: [(Int, Int)] -> Picture 
drawSnake snake = Pictures [pixelAt aquamarine $ toPoint pos | pos <- snake]

drawFood :: (Int, Int) -> Picture 
drawFood food = Color red $ pixelAt rose $ toPoint food
