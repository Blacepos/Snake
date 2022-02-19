module Util where

import Graphics.Gloss
import System.Random (mkStdGen, Random (randomR))

import World

toPoint :: (Int, Int) -> Point
toPoint (x, y) = (fromIntegral x, fromIntegral y)

foodRand :: Int -> Int
foodRand seed = fst $ randomR (0,gridSize-1) (mkStdGen seed)

screenCenter :: Float
screenCenter = fromIntegral screenSize / 2

toCenter :: Picture -> Picture 
toCenter = Translate screenCenter screenCenter