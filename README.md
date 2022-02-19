# Snake

Snake in haskell. Programming it was fun and I also learned a lot doing it.

<a href="https://hackage.haskell.org/package/gloss">Gloss</a> provides a neat function which handles all of the backend event handling, updating, and drawing of the window. This game in particular uses this function:
```Haskell
play :: Display                    -- Display mode.
     -> Color                      -- Background color.
     -> Int                        -- Number of simulation steps to take for each second of real time.
     -> world                      -- The initial world.
     -> (world -> Picture)         -- A function to convert the world a picture.
     -> (Event -> world -> world)  -- A function to handle input events.
     -> (Float -> world -> world)  -- A function to step the world one iteration. It is passed the period of time (in seconds) needing to be advanced.
     -> IO ()
```
where `world` could be any type. This leaves basically zero IO left so unless you're doing extra IO, everything is pure.
