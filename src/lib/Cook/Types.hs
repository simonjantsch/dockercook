{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Cook.Types where

import Data.Hashable
import qualified Data.ByteString as BS
import qualified Data.Text as T

newtype DownloadUrl
    = DownloadUrl { unDownloadUrl :: T.Text }
    deriving (Show, Eq, Hashable)

data CookConfig
   = CookConfig
   { cc_boringFile :: Maybe FilePath
   , cc_tagprefix :: Maybe String          -- additionally tag images using this prefix + cook filename
   , cc_cookFileDropCount :: Int           -- drop this many chars from every cook filename
   , cc_autoPush :: Bool
   , cc_forceRebuild :: Bool
   , cc_buildEntryPoints :: [String]
   } deriving (Show, Eq)

data ErrorWarningOk
   = EWOError T.Text
   | EWOWarning T.Text
   | EWOOk

newtype StreamHook =
    StreamHook { unStreamHook :: BS.ByteString -> IO () }

newtype SHA1 =
    SHA1 { unSha1 :: BS.ByteString }
         deriving (Show, Eq)

newtype DockerImage =
    DockerImage { unDockerImage :: T.Text }
    deriving (Show, Eq, Hashable)

newtype DockerImageId
    = DockerImageId { unDockerImageId :: T.Text }
    deriving (Show, Eq, Hashable)
