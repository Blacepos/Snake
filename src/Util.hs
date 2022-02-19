module Util 
    ( toPoint
    , foodRand
    , topLeft
    , toCenter
    ) where

import Graphics.Gloss
import System.Random (mkStdGen, Random (randomR))

import World

-- Create a Point from an integer pair
toPoint :: (Int, Int) -> Point
toPoint (x, y) = (fromIntegral x, fromIntegral y)

-- Get a random coordinate within the bounds of the food
foodRand :: Int -> Int
foodRand seed = fst $ randomR (0,gridSize-1) (mkStdGen seed)

screenCenter :: Float
screenCenter = fromIntegral screenSize / 2

-- Translates pictures to use normal top-down left-right coordinates
topLeft :: Picture -> Picture
topLeft = Translate (fromIntegral (-screenSize) / 2.0) (fromIntegral screenSize / 2.0) . Scale 1.0 (-1.0)

-- Translates top-left pictures to the center of the screen
toCenter :: Picture -> Picture 
toCenter = Translate screenCenter screenCenter
