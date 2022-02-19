module Controls where


import World
import Graphics.Gloss.Interface.Pure.Game

input :: Event -> World -> World
input (EventKey (Char k) Down _ _) w@World{ direction=dir } = w { direction = getDirection k dir }

input _ world = world

getDirection :: Char -> Int -> Int
getDirection key dir@1
    | key == 'a' = 2
    | key == 'd' = 4
    | otherwise  = dir

getDirection key dir@2
    | key == 'w' = 1
    | key == 's' = 3
    | otherwise  = dir

getDirection key dir@3
    | key == 'a' = 2
    | key == 'd' = 4
    | otherwise  = dir

getDirection key dir@4
    | key == 'w' = 1
    | key == 's' = 3
    | otherwise  = dir

getDirection key dir
    | key == 'w' = 1
    | key == 'a' = 2
    | key == 's' = 3
    | key == 'd' = 4
    | otherwise  = dir