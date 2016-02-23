import System.Environment

elevator :: String -> Int
elevator [] = 0
elevator (x:xs) = dir x + elevator xs
    where dir '(' = 1
          dir ')' = -1
          dir x = 0

main = do
    [f] <- getArgs
    s <- readFile f
    putStrLn (show (elevator s))
