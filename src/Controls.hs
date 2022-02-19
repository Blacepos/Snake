module Controls
    ( input
    ) where


import GameData
import Graphics.Gloss.Interface.Pure.Game
import World (initialWorld)

-- Processes input events to update the world
input :: Event -> World -> World
input (EventKey _ Down _ _) w@World{ direction=dir, state=Dead } = initialWorld

input (EventKey (Char k) Down _ _) w@World{ direction=dir } = 
    w{ direction = getDirection k dir }

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
