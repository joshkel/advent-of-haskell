import qualified Data.ByteString
import qualified Data.ByteString.Char8 as C8
import Crypto.Hash

md5 :: Data.ByteString.ByteString -> Digest MD5
md5 = hash

key = "bgvyzdsv"

advent_hash n = digestToHexByteString $ md5 (C8.pack (key ++ show n))

advent_coins prefix = [ i | i <- [1..], Data.ByteString.take 5 (advent_hash i) == prefix ]

zeroes n = C8.pack $ replicate n '0'

main = do
    putStrLn ("Five leading zeroes " ++ show (head $ advent_coins (zeroes 5)))
    putStrLn ("Six leading zeroes " ++ show (head $ advent_coins (zeroes 6)))
