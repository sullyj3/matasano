import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import qualified Data.ByteString.Base16 as B16
import qualified Data.ByteString.Base64 as B64

import Data.Bits (xor)

{- I don't really understand order of operations yet, so I'm just gonna use
 - loads of parens. Look back and cringe, future self -}

bsfromHex :: String -> B.ByteString
bsfromHex s = fst (B16.decode (BC.pack s))

b64fromHex :: String -> String
b64fromHex s =
	BC.unpack (B64.encode (bsfromHex s))

xorBS :: B.ByteString -> B.ByteString -> B.ByteString
xorBS b1 b2 = B.pack (B.zipWith xor b1 b2)

xorHex :: String -> String -> String
xorHex h1 h2 = BC.unpack $ B16.encode ((xorBS (bsfromHex h1) (bsfromHex h2)))
