import qualified Data.Map.Strict as Map

fly :: (Int, Int) -> Char -> (Int, Int)
fly (x, y) dir
    | dir == '<'  = (x-1, y)
    | dir == '>'  = (x+1, y)
    | dir == '^'  = (x, y-1)
    | dir == 'v'  = (x, y+1)
    | otherwise = (x, y)

-- Given function like fly that takes initial and direction,
-- and an initial, it gives a list of every value hit.
makeList f start [] = [start]
makeList f start (x:xs)
    | next == start = makeList f next xs
    | otherwise     = start : makeList f next xs
    where next = f start x

mapify list = Map.fromListWith (+) (map (\x -> (x, 1)) list)

odds s  = [ x | (x, i) <- zip s [1..], i `mod` 2 == 1 ]
evens s = [ x | (x, i) <- zip s [1..], i `mod` 2 == 0 ]

main = do
    s <- getContents
    let year1_flight_path = mapify (makeList fly (0, 0) s)
    putStrLn ("Year one flight path: " ++ show (Map.size year1_flight_path))

    let santa_flight_path = makeList fly (0, 0) (odds s)
    let robo_flight_path = makeList fly (0, 0) (evens s)
    putStrLn ("Santa flight path: " ++ show (Map.size $ mapify santa_flight_path))
    putStrLn ("Robo-Santa flight path: " ++ show (Map.size $ mapify robo_flight_path))
    putStrLn ("Total flight path: " ++ show (Map.size $ mapify (santa_flight_path ++ robo_flight_path)))

