# Programming Language Design Assignment #5

> 陳錕詮 107502570
>

## 1. **Maybe**

### Functor

```haskell
instance Functor Maybe where
		fmap f (Just a) = Just (f a) 
		fmap f Nothing  = Nothing
```

### Applicative

```haskell
instance Applicative Maybe where
		pure = Just
		Nothing <*> _ = Nothing
		Just f <*> x  = fmap f x
```

### Monad

```haskell
instance Monad Maybe where
    Nothing  >>= _ = Nothing
    (Just a) >>= f = f a
    return         = Just
```

---

## 2. **MyEither**

### Functor

```haskell
instance Functor MyEither where
	  fmap f (MyLeft a)  = MyLeft a
	  fmap f (MyRight b) = MyRight (f b)
		fmap f None        = None
```

### Applicative

```haskell
instance Applicative MyEither where
		pure = MyLeft
		MyLeft  f <*> a = fmap f a
		MyRight f <*> b = fmap f b
		Nothing <*> _   = Nothing
```

### Monad

```haskell
instance Monad MyEther where
    MyLeft a >>= f  = Myleft a
		MyRight b >>= f = MyRight b
    Nothing  >>= _  = Nothing
    return          = Myleft
```

---

## 3. **MyTree**

### Functor

```haskell
instance Functor MyTree where
	  fmap f (MyLeaf a)   = MyLeaf a
		fmap f (MyNode l r) = MyNode (fmap f l) (fmap f r)
```

### Applicative

```haskell
instance Applicative MyTree where
		pure                    = MyLeaf
		MyLeaf  f <*> a         = fmap f a
		MyNode l r <*> Myleaf a = l <*> MyLeaf a
		MyNode l r <*> f        = MyNoode (l <*> f) (r <*> f)
```

### Monad

```haskell
instance Monad MyTree where
   return           = MyLeaf
   MyLeaf a >>= f   = f a
   MyNode l r >>= f = MyNode (l >>= f) (r >>= f)
```

---

## **IO Monads**
