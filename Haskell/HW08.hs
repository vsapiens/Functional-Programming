module HW08 where

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
evaluate _ _ = error "Not yet implemented."

-- Cleans a string. Given a string, return recursively a "cleaned" string where adjacent chars that are the same have been reduced to a single char. So "yyzzza" yields "yza".
cleanString :: [Char] -> [Char]

-- Multiples
multiples :: [Int] -> Int -> [Int]
multiples _ _ = error "Not yet implemented."

-- Returns a string with the binary representation of an integer value
toBinaryString :: Int -> [Char]
toBinaryString _ = error "Not yet implemented."

-- Insertion sort
insertionSort :: [Int] -> [Int]
insertionSort _ = error "Not yet implemented."