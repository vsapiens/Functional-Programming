module Challenge where

data Mat = Mat [[Int]] deriving (Show)

transMatAux :: [[Int]] -> [[Int]]
transMatAux m
    | length (head m) == 0 = []
    | otherwise = (map head m):(transMatAux (map tail m))
    --  | ([]:_) = []

transMat :: Mat -> Mat
transMat (Mat x) = Mat (transMatAux x)

modeAux ::[Int] -> [Int]
modeAux [] = []

mode :: [Int] -> [Int]
mode xs = modeAux xs

data Set = Set [Int] deriving (Show)

addSetAux:: [Int] -> Int -> [Int]
addSetAux s n
    | s == [] = []
    | elem n s = s 
    | otherwise =  s ++ [n] 

addSet :: Set -> Int -> Set
addSet (Set x) n = Set (addSetAux x n)

removeSetAux:: [Int] -> Int -> [Int]
removeSetAux [] _ = []
removeSetAux (x:rest) n
    | x == n = removeSetAux rest n
    | otherwise = x : removeSetAux rest n

removeSet :: Set -> Int -> Set
removeSet (Set x) n = Set (removeSetAux x n)

unionSetAux :: [Int] -> [Int] -> [Int]
unionSetAux [] [] = []
unionSetAux x [] = x
unionSetAux [] y = y
unionSetAux (x:xs) y = addSetAux (unionSetAux y xs) x

unionSet :: Set -> Set -> Set
unionSet (Set xs) (Set ys) = Set (unionSetAux xs ys)

intersectionSetAux :: [Int] -> [Int] -> [Int]
intersectionSetAux [] _ = []
intersectionSetAux _ [] = []
intersectionSetAux x (y:ys)
    | elem y x = y: intersectionSetAux x ys
    | otherwise = intersectionSetAux x ys

intersectionSet :: Set -> Set -> Set
intersectionSet (Set x) (Set y)= Set (intersectionSetAux x y)

mergeSortAux:: [Int] -> [Int] ->[Int]
mergeSortAux x [] = x
mergeSortAux [] y = y
mergeSortAux (x:xs) (y:ys)
    | x < y = x : (mergeSortAux xs (y:ys))
    | otherwise = y: (mergeSortAux (x:xs) ys)

mergeSort :: [Int] -> [Int]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort m = mergeSortAux (mergeSort (take (length m `div` 2) m )) (mergeSort (drop (length m `div` 2) m))