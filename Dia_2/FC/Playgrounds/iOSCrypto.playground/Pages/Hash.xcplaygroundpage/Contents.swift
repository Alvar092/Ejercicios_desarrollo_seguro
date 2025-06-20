import Foundation
import CommonCrypto
import CryptoKit


func sha256(data : Data) -> String{
    
    let dataToHash = Data(data)
    
    var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
    
    dataToHash.withUnsafeBytes { bufferPointer in
        _ = CC_SHA256(bufferPointer.baseAddress, CC_LONG(bufferPointer.count), &hash)
    }
    
    return Data(hash).base64EncodedString()
}

func sha256CryptoKit(data: Data) -> String {
    let hash = SHA256.hash(data: data)
    return Data(hash).base64EncodedString()
}

let stringToHash = "stringToHash"
let dataToHash = Data(stringToHash.utf8)
let hashCommonCrypto = sha256(data: dataToHash)
let hashCryptoKit = sha256CryptoKit(data: dataToHash)
print("CommonCrypto SHA256: \(hashCommonCrypto)")
print("CryptoKit SHA256: \(hashCryptoKit)")

func sha256Hex(data: Data) -> String {
    var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
    data.withUnsafeBytes { bufferPointer in
        _ = CC_SHA256(bufferPointer.baseAddress, CC_LONG(bufferPointer.count), &hash)
    }

    let hexString = hash.map { String(format: "%02x", $0) }.joined()
    return hexString
}

func sha256HexCryptoKit(data: Data) -> String {
    let hash = SHA256.hash(data: data)

    let hexString = hash.compactMap { String(format: "%02x", $0) }.joined()
    return hexString
}

let dataToHash2 = Data("s".utf8)
let hashHexCommonCrypto = sha256Hex(data: dataToHash2)
let hashHexCryptoKit = sha256HexCryptoKit(data: dataToHash2)
print("CommonCrypto SHA256: \(hashHexCommonCrypto)")
print("CryptoKit SHA256: \(hashHexCryptoKit)")

