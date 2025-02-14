module Types where

import Data.Array
import Control.Monad.State
import Control.Monad.Writer
import Data.Word

data Memory = Memory { memory :: Array Int Word8
                     , cursor :: Int             }

type Eval = StateT Memory (WriterT String IO)

data Instr = Next | Prev | Incr | Decr | Loop [Instr] | Get | Put | Null
    deriving (Eq, Show)

newtype Stream = Stream { input :: String }

type Parser = State Stream

cellsNumber :: Int
cellsNumber = 30000

initMemory :: Memory
initMemory = Memory { memory = array (1, cellsNumber) (zip [1..] (replicate cellsNumber 0))
                    , cursor = 1                                                            }