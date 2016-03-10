import Data.Hash.MD5

key = "bgvyzdsv"

hash n = md5s $ Str (key ++ show n)

advent_coins = [ i | i <- [1..], take 5 (hash i) == "00000" ]

main = do
    putStrLn (show $ head advent_coins)
