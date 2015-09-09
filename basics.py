from bitarray import bitarray
import base64

def hex2b64(string):
    bs = bytes.fromhex(string)
    return base64.b64encode(bs)

    
