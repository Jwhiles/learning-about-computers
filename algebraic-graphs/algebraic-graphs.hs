{-# Language TypeFamilies #-}
{-# Language ScopedTypeVariables #-}
module AlgGraphs where
import Data.Set (Set, singleton, union, elems, fromAscList)
import qualified Data.Set as Set (empty)

data GraphD a = Empty
             | VertexD a
             | Overlay (GraphD a) (GraphD a)
             | Connect (GraphD a) (GraphD a)


class Graph g where
  type Vertex g
  empty :: g
  vertex :: Vertex g -> g
  overlay :: g -> g -> g
  connect :: g -> g -> g

edge :: Graph g => Vertex g -> Vertex g -> g
edge x y = connect (vertex x) (vertex y)

vertices :: Graph g => [ Vertex g ] -> g
vertices vs = 
  foldr (overlay . vertex) empty vs

clique :: Graph g => [ Vertex g ] -> g
clique = foldr (connect . vertex) empty

-- connecting and overlaying graphs have some properties
-- overlaying  is commutative
--
-- connecting forms a monoid - with connecting to an empty graph being the
-- identity (although you might not end up with same representation of the
-- graph). 

-- It's really awkward to try and write an Eq instance for our Graph datatype.
-- Because graphs with different Haskell representations can have the same
-- canonical representation.
--
-- for exmaple (Overlay (VertexD "John") Empty) is identical to VertexD "John"
-- 
-- We can convert between different graph representations to try and get around
-- this

data Relation a = R { domain :: Set a, relation :: Set (a, a) } deriving (Eq, Show)

instance Ord a => Graph (Relation a) where
  type Vertex (Relation a) = a
  empty = R Set.empty Set.empty
  vertex x = R (singleton x) Set.empty
  overlay x y = R (domain x `union` domain y) (relation x `union` relation y)
  connect x y = R
    (domain x `union` domain y)
    (relation x `union` relation y `union`
      fromAscList [ (a, b) | a <- elems (domain x), b <- elems (domain y) ])

-- This fold function allows us to translate a graph data representation
-- into another representation based on the type class
fold :: Graph g => GraphD (Vertex g) -> g
fold Empty = empty
fold (VertexD x) = vertex x
fold (Overlay x y) = overlay (fold x) (fold y)
fold (Connect x y) = connect (fold x) (fold y)

-- Because Relation has a Eq instance - we can check our Graph data strutures
-- for equality by converting the representation

instance Ord a => Eq (GraphD a) where
  g == g' = fold g  == ((fold g') :: Relation a)

equal :: Bool
equal = Overlay (Empty) (VertexD "John") == VertexD "John"
