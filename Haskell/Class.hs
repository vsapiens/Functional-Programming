module Class1 where


data Coord  = Empty | Float Float deriving (Show, Eq)

enigma5::Coord ->Int ->Coord
enigma5 Empty _ = Empty
enigma5 (Coord x y) n = Coord ()