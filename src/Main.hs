{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Control.Lens               ((^.))
import           Control.Monad.IO.Class
import           Data.ByteString.Lazy.Char8 as BS
import           Data.Monoid                (mconcat)
import qualified Data.Text.Lazy             as T
import qualified Network.Wreq               as W
import           Web.Scotty


main = scotty 5000 $ do
    post "/relay" $ do
    {- post "/:word" $ do -}
        {- beam <- param "word" -}
        relayUrl <- body
        r <- liftIO $ W.get $ BS.unpack relayUrl
        text $ T.pack . BS.unpack $ r ^. W.responseBody

