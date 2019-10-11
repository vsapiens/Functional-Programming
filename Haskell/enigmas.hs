module Enigmas where

enigmaA1 :: [ Int ] -> [ Int ]
enigmaA1 x = (\ x y -> map y x ) x (\ x -> x + 1)

enigmaB1 :: [ Double ] -> Double -> [( Bool , Bool ) ]
enigmaB1 x y = zip ( map ( > y ) x ) ( map ( < y ) x )

enigmaC1 :: [ Int ] -> Int -> Int
enigmaC1 [] x = x
enigmaC1 ( x : xs ) y = x * ( enigmaC1 xs y )

enigmaD1 :: Char -> [( Char , Char ) ] -> [ Char ]
enigmaD1 x [] = [ x ]
enigmaD1 x (( a , b ) : c ) = a : b :( enigmaD1 b c )

enigmaA2 :: [ t ] -> Int -> [( t , Int ) ]
enigmaA2 [] x = []
enigmaA2 ( x : xs ) y = if even ( length ( xs ) )
then (x , length ( x : xs ) * y ) : enigmaA2 ( xs ) y
else enigmaA2 xs y

enigmaB2 :: [ Int ] -> Int
enigmaB2 [] = 0
enigmaB2 ( x : y ) = x * 2

enigmaC2 :: [ Int ] -> [ Int ] -> Int
enigmaC2 v w = sum ( filter ( >0) ( map (\( x , y ) -> x + y ) ( zip v w ) ) )

enigmaA3 :: Int -> Int -> [ Int ]
enigmaA3 0 _ = []
enigmaA3 _ 0 = []
enigmaA3 n m = take ( m - n ) [ n ..]

enigmaB3 :: ( Int , Int , [ Int ]) -> [ Int ]
enigmaB3 (x , 0 , ( y : z ) ) = [x , 0 , y ]
enigmaB3 (x , y , []) = [y , x ]
enigmaB3 (x , y , z ) = filter ( > x * y ) z

enigmaC3 :: [ t ] -> t
enigmaC3 [] = error " Empty list ."
enigmaC3 ( x : y : z ) = y

enigmaD3 :: [ Int ] -> [ Int ] -> [ Int ]
enigmaD3 _ [] = []
enigmaD3 [] _ = []
enigmaD3 a b = [ xs * ys | (x , xs ) <- z , (y , ys ) <- z ] 
    where z = zip ( reverse a ) b