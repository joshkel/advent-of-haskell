import Data.List (sort)
import Data.List.Split (splitOn)

wrapping_paper_area s =
    let [a,b,c] = sort [read x :: Int | x <- splitOn "x" s]
    in 3*a*b + 2*a*c + 2*b*c

main = do
    putStrLn (show (wrapping_paper_area "2x3x4"))
