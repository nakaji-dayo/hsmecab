import Text.MeCab

import Control.Monad
import Data.Maybe

main :: IO ()
main = do
  putStrLn =<< version

  m <- new ["mecab", "-l1"]

  putStrLn =<< parse m "にわにはにわにわとりがいる"
  putStrLn =<< parseNBest m 2 "にわにはにわにわとりがいる"
  putStrLn =<< parse m "すもももももももものうち"
  putStrLn =<< parseNBest m 2 "すもももももももものうち"

  -- parseNBestInit m "にわにはにわにわとりがいる"
  -- replicateM_ 5 $ do
  --   s <- nBestNext m
  --   when (isJust s) $
  --     putStrLn $ fromJust s

  -- parseNBestInit m "にわに-- はにわにわとりがいる"
  -- replicateM_ 5 $ do
  --   s <- nBestNextNodes m
  --   when (isJust s) $
  --     print $ (fromJust s :: [Node String])

  print =<< parseToNodes m "にわにはにわにわとりがいる"
