module Exam01 where

data Tree = Tree Int Tree Tree | E deriving Show

sumTree :: Tree -> Int
sumTree E = 0
sumTree (Tree n x y) = n + sumTree x + sumTree y
--(Tree 8 (Tree 5 (Tree 2 E E) (Tree 7 E E)) (Tree 9 E E))


--[("Male", 178), ("Female", 165), ("Female", 158), ("Female", 182)]

insert:: ([Char],Int) -> [([Char],Int)] -> [([Char],Int)]
insert x [] = [x]
insert y xt@(x:xs)
    | snd y < snd x = y:xt
    | otherwise = x: insert y xs

sort:: [([Char],Int)] -> [([Char],Int)]
sort [] = []
sort (x:xs) = insert x sortedRest
    where sortedRest = sort xs

myTake :: Int->[Char]->[Char]
myTake _ [] = []
myTake n (x:xs)
    | n == 0 = []
    | otherwise = x : myTake (n-1) xs

myDrop :: Int->[Char]->[Char]
myDrop _ [] = []
myDrop n (x:xs)
    | n == 0 = x:xs
    | otherwise = myDrop (n-1) xs

crossover::  [Char]->[Char]->Int->([Char],[Char])
crossover x y n = (t1,t2)
    where 
        t1 = (myTake n x) ++ (myDrop n y)
        t2 = (myTake n y) ++ (myDrop n x)

data Color = Red | Black deriving Show
data Suit = Diamonds | Hearts | Spades | Clubs deriving Show
data Rank = Jack | Queen | King | Ace deriving Show
data Card = Card (Rank, Suit) deriving Show

getValue :: Card -> Int
getValue (Card (Jack,_)) = 11
getValue (Card (Queen,_)) = 12
getValue (Card (King,_)) = 13
getValue (Card (Ace,_)) = 14

getColor :: Card -> Color
getColor (Card (_,Hearts)) = Red
getColor (Card (_,Diamonds)) = Red
getColor (Card (_,Spades)) = Black
getColor (Card (_,Clubs)) = Black

--crossover ['a','a','a','a','a'] ['b','b','b','b','b']
{-
procedure Sort(list)
    if list is empty then
        return the empty list
    else
        sortedRest = Sort(rest of list)
        return Insert(first of list, sortedRest)
    end if
end procedure
-}
