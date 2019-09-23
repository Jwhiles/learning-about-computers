module Graph where
import Data.Array


-- this could just be a list.
data EdgeNode = EdgeNode
  { tag :: Int
  , next :: EdgeNode
  } | End

instance Show EdgeNode where
  show (EdgeNode tag next) = show tag <> " -> " <> show next
  show (End) = "()"

data Graph = Graph
  { numberOfVertices :: Int
  , list :: Array Int EdgeNode
  }

createGraph :: Int -> Graph
createGraph numberOfVertices =
  Graph
    numberOfVertices 
    (array (1, numberOfVertices) [(i, End) | i <- [ 1 .. numberOfVertices ]]) 


data Directed = Directed | Undirected

addEdge :: Int -> Int -> Directed -> Graph -> Graph
addEdge x y Directed (Graph n edges) = 
  Graph n (edges // [(x, (EdgeNode y (edges ! x) ))])
addEdge x y Undirected (Graph n edges) = 
  addEdge y x Directed (Graph n (edges // [(x, (EdgeNode y (edges ! x) ))]))
  


instance Show Graph where
  show (Graph n l) = foldr (\en rest -> show en <> "\n" <> rest) "" l


data Visited = Visited | NotVisited

breadthFirst :: Int -> Graph -> Bool
breadthFirst startPoint (Graph numberOfVertices edges) =
  let visited = replicate numberOfVertices NotVisited
  in False

  
