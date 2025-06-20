import Foundation
import CommonCrypto
import CryptoKit

/*:
 # Hashing functions
 
 Esta página muestra las funciones hash SHA-2 para 256 bits.
###  Table of contents
- CommonCrypto SHA256 to base 64
- CryptoKit SHA256 to base64
- CommonCrypto SHA256 to hex
- CryptoKit SHA256 to hex
 
 ![Hashing](hash.png)
 */
//: ## CommonCrypto SHA256 to base 64
/// Create a SHA256 representation of the data passed as parameter (common crypto)
/// - Parameter data: The data that will be converted to SHA256.
/// - Returns: The SHA256 representation of data.
func sha256(data : Data) -> String{
    
    // Get the data of the sha256 in a variable. When working with common crypto is a good practice
    let dataToHash = Data(data)
    
    // Create a byte array to which the data will be copied with length 256
    var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
    
    // Copy the data to the hash byte array (Common crypto, not cryptoKit)
    // Withunsafebytes permite acceder al array de bytes de dataToHash
    dataToHash.withUnsafeBytes { bufferPointer in
        // La función sha pide la localización de memoria donde empieza lo que se va a encriptar y el lugar donde acaba. Se almacena en hash
        _ = CC_SHA256(bufferPointer.baseAddress, CC_LONG(bufferPointer.count), &hash)
    }
    
    // Convert hash to a base 64 string
    return Data(hash).base64EncodedString()
}

//: ## CryptoKit SHA256 to base64
/// Create a SHA256 representation of the data passed as parameter (crypto kit)
/// - Parameter data: The data that will be converted to SHA256.
/// - Returns: The SHA256 representation of data.
func sha256CryptoKit(data: Data) -> String {
    let hash = SHA256.hash(data: data)
    return Data(hash).base64EncodedString()
}

/*:
 - Example: Hashing a string "stringToHash" with SHA256
 */
let stringToHash = "stringToHash"
let dataToHash = Data(stringToHash.utf8)
let hashCommonCrypto = sha256(data: dataToHash)
let hashCryptoKit = sha256CryptoKit(data: dataToHash)
print("CommonCrypto SHA256: \(hashCommonCrypto)")
print("CryptoKit SHA256: \(hashCryptoKit)")

//: ## CommonCrypto SHA256 to hex
/// Create a SHA256 representation of the data passed as parameter (common crypto)
/// - Parameter data: The data that will be converted to SHA256.
/// - Returns: The SHA256 representation of data.
func sha256Hex(data: Data) -> String {
    var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
    data.withUnsafeBytes { bufferPointer in
        _ = CC_SHA256(bufferPointer.baseAddress, CC_LONG(bufferPointer.count), &hash)
    }

    // Convert hash to hexadecimal string: 2 hex digits -> 255 possible values, padded with %0 to the left if the number is less than 16, the x intends for hexadecimal.
    let hexString = hash.map { String(format: "%02x", $0) }.joined()
    return hexString
}

//: ## CryptoKit SHA256 to hex
/// Create a SHA256 representation of the data passed as parameter (crypto kit)
/// - Parameter data: The data that will be converted to SHA256.
/// - Returns: The SHA256 representation of data.
func sha256HexCryptoKit(data: Data) -> String {
    let hash = SHA256.hash(data: data)

    // Convert hash to hexadecimal string
    let hexString = hash.compactMap { String(format: "%02x", $0) }.joined() // Compactmap mejor map, porque String(format no produce nil
    return hexString
}
/*:
 - Example: Hashing a string "stringToHash" with SHA256 to hex
 */
let dataToHash2 = Data("s".utf8)
let hashHexCommonCrypto = sha256Hex(data: dataToHash2)
let hashHexCryptoKit = sha256HexCryptoKit(data: dataToHash2)
print("CommonCrypto SHA256: \(hashHexCommonCrypto)")
print("CryptoKit SHA256: \(hashHexCryptoKit)")


