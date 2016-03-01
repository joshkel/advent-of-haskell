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
makeList f start (x:xs) = start : makeList f (f start x) xs

main = do
    s <- getContents
    let l = makeList fly (0, 0) s
    putStrLn ("Flight path: " ++ show (l))

