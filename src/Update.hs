module Update where

import System.Random

import World (World ( .. ), GameState ( .. ), initialWorld, screenSize, gridSize)
import Util


-- if food was hit this frame, don't move snake

-- create new position in direction: newPos:snake
-- check position for food: newPos == snake
-- if yes, make new food
-- else, snake = init snake

update :: Float -> World -> World
update _ w@World{ state=Start, direction=dir } = 
    w{ state = if dir==0 then Start else Alive
     }

update _ w@World{ state=Dead } = initialWorld

update _ w@(World food snake dir state seed) =
    w{ foodRandSeed = seed+2
     , snake        = nextSnake hitType dir snake
     , foodPosition = nextFood hitType seed food
     , state        = if validSnake snake && snakeInbounds snake
                      then Alive
                      else Dead
     }
     where hitType = if head snake == food
                     then Hit
                     else NoHit

data FoodHit = Hit | NoHit

nextFood :: FoodHit -> Int -> (Int, Int) -> (Int, Int)
nextFood Hit currentSeed _ = (x, y)
                             where x = foodRand currentSeed
                                   y = foodRand (currentSeed+1)

nextFood NoHit _ food = food

nextSnake :: FoodHit -> Int -> [(Int, Int)] -> [(Int, Int)]
nextSnake Hit dir snake = addSnakeHead dir snake
nextSnake NoHit dir snake = init $ addSnakeHead dir snake

addSnakeHead :: Int -> [(Int, Int)] -> [(Int, Int)]
addSnakeHead _ [] = []
addSnakeHead dir snake@((x, y):tail)
    | dir == 1  = (x, y-1) : snake
    | dir == 2  = (x-1, y) : snake
    | dir == 3  = (x, y+1) : snake
    | dir == 4  = (x+1, y) : snake
    | otherwise = snake

validSnake :: [(Int, Int)] -> Bool
validSnake [] = True
validSnake [s] = True
validSnake (snakeHead:snakeTail) = snakeHead `notElem` snakeTail

snakeInbounds :: [(Int, Int)] -> Bool
snakeInbounds [] = True
snakeInbounds ((x, y):_) = x >= 0 && x < gridSize && y >= 0 && y < gridSize 