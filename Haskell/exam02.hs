module EX02 where

myTake:: Int -> [t]->[t]
myTake _ [] = []
myTake n (x:xs)
    | n == 0 = []
    | otherwise = x : myTake (n-1) xs

myRemove :: Int -> [t]->[t]
myRemove _ [] = []
myRemove n x = myTake (length x - n) x

quicksort:: [Int] -> [Int]
quicksort [] = []
quicksort (x:xs) = (quicksort l)++[x]++(quicksort r)
    where
        l = (filter (\y -> y < x) xs)
        r = (filter (\y -> y >= x) xs)

data Complex = Complex Int Int deriving Show

add:: Complex -> Complex -> Complex
add (Complex a b ) (Complex c d) = Complex (a+c) (b+d)

multiplication:: Complex -> Complex -> Complex
multiplication (Complex a b ) (Complex c d) = Complex (a*c) (b*d)

getReal:: Complex  -> Int
getReal (Complex a _) = a

getImaginary:: Complex -> Int
getImaginary (Complex _ b) = b
