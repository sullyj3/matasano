import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import qualified Data.ByteString.Base16 as B16
import qualified Data.ByteString.Base64 as B64

{- I don't really understand order of operations yet, so I'm just gonna use
 - loads of parens. Look back and cringe, future self -}
b64fromHex :: String -> String
b64fromHex s =
	BC.unpack
		(B64.encode
			(fst (B16.decode (BC.pack s))))
