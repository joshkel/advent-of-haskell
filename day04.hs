import Data.Hash.MD5

key = "bgvyzdsv"

hash n = md5s $ Str (key ++ show n)

advent_coins prefix = [ i | i <- [1..], take 5 (hash i) == prefix ]

zeroes n = replicate n '0'

main = do
    putStrLn ("Five leading zeroes " ++ show (head $ advent_coins (zeroes 5)))
    putStrLn ("Six leading zeroes " ++ show (head $ advent_coins (zeroes 6)))
