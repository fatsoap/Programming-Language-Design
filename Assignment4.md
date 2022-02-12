# Programming Language Design Assignment #4

> 陳錕詮 107502570
>

1. Implement your own `tail` function

```haskell
myTail' :: [a] -> [a]
myTail' [] = error "empty list"
myTail' [x] = []
myTail' (_:xs) = xs ++ myTail' xs
```

1. Implement your own `last` function

```haskell
myLast' :: [a] -> a
myLast' [] = error "empty list"
myLast' [x] = x
myLast' (x:xs) = myLast' xs
```

1. Implement your own `reverse` function

```haskell
myReverse' :: [a] -> [a]
myReverse' [] = []
myReverse' (x:[]) = [x]
myReverse' (x:xs) = myReverse' xs ++ [x]
```

1. Implement `isPalindrome` which checks a list is palindrome or not

```haskell
isPalindrome :: Eq a => [a] -> Bool
isPalindrome xs = xs == (myReverse' xs)
```

1. Implement `isPalindrome'` again but without using `reverse` this time

```haskell
isPalindrome' []  = True
isPalindrome' [_] = True
isPalindrome' xs  = (head xs) == (last xs) && (isPalindrome' $ init $ tail xs)
```

[Programming Language Design Assignment #4 - HackMD](https://hackmd.io/@aaaaares/B16E_OarK)
