
module Main where

import qualified TinyTest
import System.Exit

main :: IO ()
main = if TinyTest.tb == "YO!"
       then putStrLn "PASS" >> exitSuccess
       else putStrLn "FAIL" >> exitFailure
