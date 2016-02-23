import Data.List (sort)
import Data.List.Split (splitOn)

tuplify3 :: [a] -> (a,a,a)
tuplify3 [x,y,z] = (x,y,z)

box_dimensions :: String -> (Int,Int,Int)
box_dimensions s = tuplify3 (sort [read x :: Int | x <- splitOn "x" s])

wrapping_paper_area :: (Int,Int,Int) -> Int
wrapping_paper_area (a,b,c) = 3*a*b + 2*a*c + 2*b*c

ribbon_length :: (Int,Int,Int) -> Int
ribbon_length (a,b,c) = 2*a + 2*b + a*b*c

main = do
    contents <- getContents
    let dimensions = map box_dimensions (lines contents)
    putStrLn ("Wrapping paper: " ++ show (sum(map wrapping_paper_area dimensions)))
    putStrLn ("Ribbon:         " ++ show (sum(map ribbon_length dimensions)))
