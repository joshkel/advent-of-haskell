import System.Environment
import Data.Maybe
import Data.List

next_floor start_floor dir xs =
    let n = start_floor + dir
    in  elevator n xs

elevator :: Int -> String -> [Int]
elevator start_floor [] = [start_floor]
elevator start_floor (x:xs)
    | x == '('  = start_floor : next_floor start_floor 1 xs
    | x == ')'  = start_floor : next_floor start_floor (-1) xs
    | otherwise = elevator start_floor xs   -- ignore unknown characters

main = do
    s <- getContents
    putStrLn ("Final position: " ++ (show (last (elevator 0 s))))
    putStrLn ("Reach floor -1: " ++ (show (fromJust $ elemIndex (-1) (elevator 0 s))))
