module Main where

import Data.Char ( isDigit, isSpace )

get_head :: [Token] -> Token
get_head [] = T_EOF
get_head (t : ts) = t

get_tail :: [Token] -> [Token]
get_tail [] = error "Wrong Input Format"
get_tail (t : ts) = ts

-- Token --
data Operator = Plus | Minus | Mul | Div
    deriving (Show, Eq)

data Token = T_Operator Operator
    | T_Integer Int
    | T_Left_Paren 
    | T_Right_Paren
    | T_Percent     -- %
    | T_EOF
    deriving (Show, Eq)

-- Char -> Operator --
char2operator :: Char -> Operator
char2operator c | c == '+' = Plus
    | c == '-' = Minus
    | c == '*' = Mul
    | c == '/' = Div

-- String -> Token[] --
string2token :: String -> [Token]
string2token [] = []
string2token (c : cs) 
    | c == '(' = T_Left_Paren : string2token cs
    | c == ')' = T_Right_Paren : string2token cs
    | elem c "+-*/" = T_Operator (char2operator c) : string2token cs
    | c == '%'  = T_Percent : string2token cs
    | isDigit c = char2integer c cs
    | isSpace c = string2token cs
    | otherwise = error "Wrong Input Format"

-- Char -> Integer --
char2integer :: Char -> [Char] -> [Token]
char2integer c cs = 
   let (digits, cs1) = span isDigit cs in
   T_Integer (read (c : digits)) : string2token cs1

-- Tree --
data Tree = P_M_Node Operator Tree Tree
    | M_D_Node Operator Tree Tree
    | R_N_Node Int Int
    deriving Show

-- Parse Token to Tree --
token2tree :: [Token] -> Tree
token2tree ts = let (tree, ts1) = token2exp ts
    in 
        if null ts1
        then tree
        else error "Wrong Input Format"

token2exp :: [Token] -> (Tree, [Token])
token2exp ts = 
    let (left_tree, ts1) = token2term ts
    in
        case get_head ts1 of
            (T_Operator op) | elem op [Plus, Minus] ->
                let (right_tree, ts2) = token2exp (get_tail ts1)
                in (P_M_Node op left_tree right_tree, ts2)
            _ -> (left_tree, ts1)

token2term :: [Token] -> (Tree, [Token])
token2term ts = 
    let (left_tree, ts1) = token2factor ts
    in 
        case get_head ts1 of
            (T_Operator op) | elem op [Mul, Div] -> 
                let (right_tree, ts2) = token2term (get_tail ts1)
                in (M_D_Node op left_tree right_tree, ts2)
            _ -> (left_tree, ts1)

token2factor :: [Token] -> (Tree, [Token])
token2factor ts = 
    case get_head ts of
        T_Left_Paren -> -- (
            let ts1 = get_tail ts
            in case get_head ts1 of 
                (T_Integer x) -> -- Int
                    let ts2 = get_tail ts1
                    in case get_head ts2 of
                        T_Percent -> -- %
                            let ts3 = get_tail ts2
                            in case get_head ts3 of
                                (T_Integer y) ->
                                    let ts4 = get_tail ts3
                                    in case get_head ts4 of 
                                        T_Right_Paren -> (R_N_Node x y, get_tail ts4) -- )
                                        _ -> error "Wrong Input Format"
                                _ -> error "Wrong Input Format"
                        _ -> error "Wrong Input Format"
                _ -> 
                    let (exp_tree, ts2) = token2exp (get_tail ts1)
                    in 
                       if get_head ts2 == T_Right_Paren 
                       then (exp_tree, get_tail ts2)
                       else error "Wrong Input Format"
        _ -> error "Wrong Input Format"

-- Calculate --
calculate :: Tree -> Tree
calculate (R_N_Node x y) = R_N_Node x y
calculate (P_M_Node op left_tree right_tree) = 
    let (R_N_Node lx ly)  = calculate left_tree 
        (R_N_Node rx ry) = calculate right_tree 
    in 
        if ly == 0 || ry == 0
        then error "divide by zero"
        else
            case op of 
                Plus -> 
                    let a = lx * ry + rx * ly
                        b = ly * ry
                        d = gcd a b   
                    in R_N_Node (div a d) (div b d)
                Minus -> 
                    let a = lx * ry - rx * ly
                        b = ly * ry
                        d = gcd a b 
                    in R_N_Node (div a d) (div b d)
                _ -> error "Wrong Input Format"

calculate (M_D_Node op left_tree right_tree) = 
    let (R_N_Node lx ly)  = calculate left_tree 
        (R_N_Node rx ry) = calculate right_tree 
    in
        if ly == 0 || ry == 0
        then error "divide by zero"
        else 
            case op of
                Mul -> 
                    let 
                        a = (lx * rx)
                        b = (ly * ry)
                        d = gcd a b
                    in R_N_Node (div a d) (div b d) 
                Div -> 
                    let
                        a = (lx * ry)
                        b = (rx * ly)
                        d = gcd a b
                    in 
                        if b == 0
                        then error "divide by zero"
                        else R_N_Node (div a d) (div b d)
                _ -> error "Wrong Input Format"

rn2string :: Tree -> String 
rn2string node =
    case node of 
        R_N_Node a b -> 
            if a >= 0 
            then show a ++ " % " ++ show b
            else "(" ++ show a ++ ") % " ++ show b
        _ -> error "Wrong Input Format"


-- 107502570 陳錕詮 Haskell Final Project : Rational Arithmetic Evaluation --
main :: IO ()
main = do
  putStrLn "Input Arithmetic String : "
  arithmetic_str <- getLine
  print (rn2string (calculate (token2tree (string2token (arithmetic_str) ) ) ) )