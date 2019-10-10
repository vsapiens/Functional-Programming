module HW09 where
--Erick Francisco González Martínez A01039859

-- Matrices
data Mat = Mat [[Int]] deriving (Show)

matMultiplicationAux :: [[Int]] -> [[Int]] -> [[Int]]
matMultiplicationAux [] [] = []

matMultiplication :: Mat -> Mat -> Mat
matMultiplication (Mat x) (Mat y) = Mat (matMultiplicationAux x y)

-- Table summarization
averageHeight::[([Char],Int)]->[([Char],Int)]
averageHeight m = 
    [("Hombre", sum t1 `div` length t1),("Mujer",sum t2 `div` length t2)]
    where
    t1 = map (\(x,y) -> y) $ filter (\(x,y) -> x == "Hombre") m
    t2 = map (\(x,y) -> y) $ filter (\(x,y) -> x == "Mujer") m

-- List comprehension
threshhold::[([Char],Int)]-> Int ->[([Char],Int)]
threshhold [] _ = []
threshhold m n = filter (\(x,y) -> y <= n) m

--Operations on graphs

data Graph = Graph [ [ Int ] ] deriving (Show)