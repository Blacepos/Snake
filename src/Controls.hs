module Controls
    ( input
    , Direction
    ) where


import GameData
import Graphics.Gloss.Interface.Pure.Game

input :: Event -> World -> World
input (EventKey (Char k) Down _ _) w@World{ direction=dir } = w { direction = getDirection k dir }

input _ world = world

-- Gets a direction based on the keypresses
getDirection :: Char -> Direction -> Direction
getDirection key dir@DirUp
    | key == 'a' = DirLeft
    | key == 'd' = DirRight
    | otherwise  = dir

getDirection key dir@DirLeft
    | key == 'w' = DirUp
    | key == 's' = DirDown
    | otherwise  = dir

getDirection key dir@DirDown
    | key == 'a' = DirLeft
    | key == 'd' = DirRight
    | otherwise  = dir

getDirection key dir@DirRight
    | key == 'w' = DirUp
    | key == 's' = DirDown
    | otherwise  = dir

getDirection key dir
    | key == 'w' = DirUp
    | key == 'a' = DirLeft
    | key == 's' = DirDown
    | key == 'd' = DirRight
    | otherwise  = dir
