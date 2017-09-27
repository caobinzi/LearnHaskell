{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric     #-}

import           Web.Spock
import           Web.Spock.Config

import           Data.Aeson       hiding (json)
import           Data.Monoid      ((<>))
import           Data.Text        (Text, pack)
import           GHC.Generics
import           Lib


data Person = Person
    { name :: Text
      , age  :: Int
    } deriving (Generic, Show)

instance ToJSON Person

instance FromJSON Person

type Api = SpockM () () () ()

type ApiAction a = SpockAction () () () a

main :: IO ()
main = do
     spockCfg <- defaultSpockCfg () PCNoDatabase ()
     runSpock 8080 (spock spockCfg app)

app :: Api
app = do
    get "people" $ do
         json $ Person { name = "Fry", age = 25 }
