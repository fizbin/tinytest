module TinyTest ( tc
                , tb
                ) where 


import Text.XML.HXT.Core
import Text.HandsomeSoup
import qualified Text.XML.HXT.DOM.XmlNode as XN
import qualified Data.Tree.Class as T

import Control.Monad.Maybe (runMaybeT)
import Data.List (isInfixOf)
import Data.Maybe (fromMaybe)

-- A value that depends on libraries
tc :: IOStateArrow Bool XmlTree XmlTree
tc = changeUserState maybeOff &&& innerArrow &&& changeUserState maybeOn
     >>> arr3 (\a b c -> b)
  where
    innerArrow = 
         listA (arrL T.getChildren >>> tc) &&& arr T.getNode &&& getUserState
         >>>
         arr3 maybeTree
         >>>
         none ||| this
    maybeOn xn s = s || maybe False (isInfixOf "BEGIN") (XN.getCmt xn)
    maybeOff xn s = s && not (maybe False (isInfixOf "END") (XN.getCmt xn))

    maybeTree kids top state
      | state || not (null (drop 1 kids)) = Right (T.mkTree top kids)
      | not (null kids) = Right (head kids)
      | otherwise = Left ()


tb :: String
tb = "YO!"
