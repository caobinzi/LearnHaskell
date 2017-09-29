{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric     #-}

import           Web.Spock
import           Web.Spock.Config

import           Data.Aeson       hiding (json)
import           Data.Monoid      ((<>))
import           Data.Text        (Text, pack)
import           Data.Text.Conversions        (convertText)
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

class MyClass a where  
    ok :: a -> Bool

--instance MyClass [a] where  
 --   ok x = False

--instance MyClass Person where  
 --   ok x = True

instance MyClass Int where  
    ok x = True

func :: [a] -> a
func [] = error "Can't call head on an empty list, dummy!"  
func (x:_) = x 

main :: IO ()
main = do
     spockCfg <- defaultSpockCfg () PCNoDatabase ()
     runSpock 8080 (spock spockCfg app)

app :: Api
app = do
    get "people" $ do
         json $ Person { name = "Fry", age = 25 }
