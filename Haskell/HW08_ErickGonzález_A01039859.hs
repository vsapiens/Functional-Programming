module HW08 where
--Erick Francisco González Martínez A01039859

-- Complete the following functions and submit your file to Canvas.

-- ========= IMPORTANT ==========
-- Change the name of the file so that it contains your student ID or name.
-- Do not change the names of the functions. The system will specifically look for the names used in this file. Changing the name of a function will automatically make you lose the points for that function.
-- Do not change the number of arguments in the functions. Changing the number of arguments of a function will automatically make you lose the points for that function.
-- Make sure that nothing additional is printed as the result of running this file. Avoid printing names, student IDs, or any other messages. If you print anything else, the system will wrongly grade your solutions.
-- If your file cannot be loaded by the Haskell compiler, your grade will be zero. Then, submit only code that works.

-- Inverts a list
invert :: [t] -> [t]
invert [] = [] 
invert (x: rest) = invert rest ++ [x]

-- Evaluation of polynomials
evaluate :: [Double] -> Double -> Double
evaluate [] _ = 0
evaluate (x:rest) n = 
    x*(n^(length rest)) + evaluate rest n

-- Cleans a string. Given a string, return recursively a "cleaned" string where adjacent chars that are the same have been reduced to a single char. So "yyzzza" yields "yza".
cleanString :: [Char] -> [Char]
cleanString [] = [] 
cleanString [x] = [x]
cleanString (x:rest) = if elem x rest
                then cleanString rest
                else [x] ++ cleanString rest
-- Multiples
multiples :: [Int] -> Int -> [Int]
multiples [] _ = []
multiples (x:rest) n = if x `mod` n == 0
                        then x : multiples rest n
                        else multiples rest n

-- Returns a string with the binary representation of an integer value
toBinaryString :: Int -> [Char]
toBinaryString x
    | x == 0 = "0"
    | x == 1 = "1"
    | mod x 2 == 0 = toBinaryString (div x 2) ++ "1"
    | not(mod x 2 == 0) =   toBinaryString (div x 2) ++ "0"

--Insertion sort Aux
insertionSortAux:: Int -> [Int] -> [Int]
insertionSortAux y [] = [y]
insertionSortAux y (x:xs)
    | x > y   =  y:x:xs
    | otherwise =  x : insertionSortAux y xs

-- Insertion sort
insertionSort :: [Int] -> [Int]
insertionSort [] = []
insertionSort [x] = [x]
insertionSort (x:xs) = insertionSortAux x (insertionSort xs)