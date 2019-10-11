module EX03 where
    
lambda:: Int -> Int-> Int
lambda n m = ((\x y -> if x >= y then x-y else x+y) n m)

recursionAux:: [Int] -> Int -> Int -> (Int,Int)
recursionAux [] m n = ( m , n )
recursionAux (x:xs) m n
    | m < x && n > x = recursionAux xs m n
    | m < x && n <= x = recursionAux xs m x
    | m >= x && n > x = recursionAux xs x n
    | otherwise = recursionAux xs x x
    

recursion:: [Int] -> (Int,Int)
recursion n = recursionAux n (head n) (head n)


data RGB = RGB (Int,Int,Int) deriving Show

getR ::RGB ->Int
getR (RGB (n,_,_)) = n

getG ::RGB ->Int
getG (RGB (_,n,_)) = n

getB ::RGB ->Int
getB (RGB (_,_,n)) = n

combine :: RGB -> RGB -> RGB
combine (RGB (r,g,b)) (RGB (r1,r2,r3)) = RGB (((r+r1) `div` 2),((g+r2) `div` 2),((b+r3) `div` 2))

getMaxComponent :: RGB -> ([Char],Int)
getMaxComponent (RGB (r,g,b))
    | g > b && b > r = ("Green",g)
    | g < b && b  < r = ("Red",r)
    | otherwise = ("Blue",b)