import System.Environment

elevator :: String -> Int
elevator [] = 0
elevator (x:xs) = dir x + elevator xs
    where dir '(' = 1
          dir ')' = -1
          dir x = 0

stop_at_floor :: String -> Int -> Int
stop_at_floor s stop_at = head [ n | n <- [1..length s], let e = elevator (take n s), e == stop_at ]

main = do
    [f] <- getArgs
    s <- readFile f
    putStrLn ("Final position: " ++ (show (elevator s)))
    putStrLn ("Reach floor -1: " ++ (show (stop_at_floor s (-1))))
