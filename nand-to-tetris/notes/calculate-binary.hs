module CalculateBinary where

data Binary = One | Zero

instance Show Binary where
  show One = "1"
  show Zero = "0"

calculate :: Int -> [Binary]
calculate 0 = [ Zero ]
calculate i
  | i < 0 = error "I didn't implement negative numbers yet. soz"
  | otherwise =
      snd $ foldr 
              (\power (acc, res) -> 
                  if power <= acc 
                    then (acc - power, res <> [One]) 
                    else (acc, res <> [Zero])) 
              (i, []) 
              (getPowers i)


getPowers :: Int -> [Int]
getPowers i = takeWhile (\x -> x <= i) [ 2 ^ x | x <- [0..]]


