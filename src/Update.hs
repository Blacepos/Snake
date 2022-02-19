module Update
    ( update
    ) where

import System.Random

import World (initialWorld, screenSize, gridSize)
import GameData
import Util

-- Step the world one frame
update :: Float -> World -> World
update _ w@World{ state=Start, direction=dir } = 
    w{ state = if dir==DirNone
               then Start
               else Alive
     }

update _ w@World{ state=Dead } = w

update _ w@(World food snake dir state seed) =
    w{ foodRandSeed = nextSeed hitType seed
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

nextSnake :: FoodHit -> Direction -> [(Int, Int)] -> [(Int, Int)]
nextSnake Hit dir snake = addSnakeHead dir snake
nextSnake NoHit dir snake = init $ addSnakeHead dir snake

addSnakeHead :: Direction -> [(Int, Int)] -> [(Int, Int)]
addSnakeHead _ [] = []
addSnakeHead dir snake@((x, y):tail)
    | dir == DirUp    = (x, y-1) : snake
    | dir == DirLeft  = (x-1, y) : snake
    | dir == DirDown  = (x, y+1) : snake
    | dir == DirRight = (x+1, y) : snake
    | otherwise       = snake

validSnake :: [(Int, Int)] -> Bool
validSnake [] = True
validSnake [s] = True
validSnake (snakeHead:snakeTail) = snakeHead `notElem` snakeTail

snakeInbounds :: [(Int, Int)] -> Bool
snakeInbounds [] = True
snakeInbounds ((x, y):_) = x >= 0 && x < gridSize && y >= 0 && y < gridSize 

nextSeed :: FoodHit -> Int -> Int
nextSeed Hit seed = seed+2
nextSeed NoHit seed = seed