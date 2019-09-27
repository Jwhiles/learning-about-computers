module DataStructures where

data List a 
  = Cons a (List a) 
  | Nil
  deriving Show

searchList :: Eq a => List a -> a -> Bool

searchList (Cons head tail) target = 
  if head == target 
    then True 
    else searchList tail target

searchList Nil _ = False

insertIntoList :: List a -> a -> List a
insertIntoList list item = Cons item list


deleteFromList :: Eq a => List a -> a -> List a

deleteFromList
  Nil target = Nil

deleteFromList
  (Cons head rest) target =
    if head == target
      then deleteFromList rest target
      else Cons head (deleteFromList rest target)


-- class Queue q where
--   enqueue :: a -> q -> q
--   deque :: q -> Maybe a

-- instance Queue (List) where
--   enqueue x l = Cons x l
--

newtype Stack a = Stack { stack :: List a }

push :: a -> Stack a -> Stack a

pop :: Stack a -> a

  
  
