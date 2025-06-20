import Foundation
import CommonCrypto
import CryptoKit


/// Create a SHA256 representation of the data passed as parameter (common crypto)
/// - Parameter data: The data that will be converted to SHA256.
/// - Returns: The SHA256 representation of data.
func sha256(data : Data) -> String{
    
    // Get the data of the sha256 in a variable
    let dataToHash = Data(data)
    
    // Create a byte array to which the data will be copied
    var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
    
    // Copy the data to the hash byte array (Common crypto, not cryptoKit)
    dataToHash.withUnsafeBytes { bufferPointer in
        _ = CC_SHA256(bufferPointer.baseAddress, CC_LONG(bufferPointer.count), &hash)
    }
    
    // Convert hash to a base 64 string
    return Data(hash).base64EncodedString()
}

/// Create a SHA256 representation of the data passed as parameter (crypto kit)
/// - Parameter data: The data that will be converted to SHA256.
/// - Returns: The SHA256 representation of data.
func sha256CryptoKit(data: Data) -> String {
    let hash = SHA256.hash(data: data)
    return Data(hash).base64EncodedString()
}

