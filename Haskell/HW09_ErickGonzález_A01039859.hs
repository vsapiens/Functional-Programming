module HW09 where
import Data.List
import Data.Ord
--Erick Francisco González Martínez A01039859

-- Matrices

dotProduct :: [Int] -> [Int] -> Int
dotProduct v w = sum (map (\(x, y) -> x * y) (zip v w))

matMultiplicationAux :: [[Int]] -> [[Int]] -> [[Int]]
matMultiplicationAux x y = [dotProduct (head x) (head y)]:[]

-- Table summarization
averageHeight::[([Char],Int)]->[([Char],Int)]
averageHeight m = 
    [("Male", sum t1 `div` length t1),("Female",sum t2 `div` length t2)]
    where
    t1 = map (\(x,y) -> y) $ filter (\(x,y) -> x == "Male") m
    t2 = map (\(x,y) -> y) $ filter (\(x,y) -> x == "Female") m

-- List comprehension
threshhold::[([Char],Int)]-> Int ->[([Char],Int)]
threshhold [] _ = []
threshhold m n = filter (\(x,y) -> y <= n) m

--Operations on graphs
data Graph = Graph [(Int,Int)] deriving (Show)

mode :: [Int] -> Int
mode xs = head (maximumBy (comparing length) (group xs))

largestDegreeAux :: [(Int,Int)] -> Int
largestDegreeAux g = mode (map (\(x,y) -> x) g)

largestDegree :: Graph -> Int
largestDegree (Graph x) = largestDegreeAux x


