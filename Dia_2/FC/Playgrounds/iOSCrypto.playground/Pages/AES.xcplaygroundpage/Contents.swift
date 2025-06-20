
import Foundation
import CryptoKit



enum AESKeySize: Int {
    case bits128 = 16
    case bits192 = 24
    case bits256 = 32
}

func paddedKey_PKCS7(from key: String, withSize size: AESKeySize = .bits256) -> Data {
    guard let keyData = key.data(using: .utf8) else { return Data() }
    if(keyData.count == size.rawValue) {return keyData}
    if(keyData.count > size.rawValue) {return keyData.prefix(size.rawValue)}
    let paddingSize = size.rawValue - keyData.count % size.rawValue
    let paddingByte: UInt8 = UInt8(paddingSize)
    let padding = Data(repeating: paddingByte, count: paddingSize)
    return keyData + padding
}

func encrypt(input: Data, key: String) -> Data {
    do {
        let keyData = paddedKey_PKCS7(from: key, withSize: .bits128)
        let key = SymmetricKey(data: keyData)
        let sealed = try AES.GCM.seal(input, using: key)
        return sealed.combined!
    } catch let er {
        return "Error while encryption".data(using: .utf8)!
    }
}

func decrypt(input: Data, key: String) -> Data {
    do {
        let keyData = paddedKey_PKCS7(from: key, withSize: .bits128)
        let key = SymmetricKey(data: keyData)
        let box = try AES.GCM.SealedBox(combined: input)
        let opened = try AES.GCM.open(box, using: key)
        return opened
    } catch {
        return "Error while decryption".data(using: .utf8)!
    }
}

let key = "pass"
let data = "M5HxzWJq+uN6PM8IxRSQBdDQ7eBzvRvpW7xVfj3umZ4="
let dataToEncrypt = data.data(using: .utf8)!
let encryptedData = encrypt(input: dataToEncrypt, key: key)
let sealedBoxBase64 = encryptedData.base64EncodedString()
print("Encrypted data base64: \(sealedBoxBase64)")
print("The following should be an error -> \(String(data: encryptedData, encoding: .utf8) ??  "Error: correctly AES encrypted data box should show this error")")
let decryptedData = decrypt(input: encryptedData, key: key)
print("Decrypted data: \(String(data: decryptedData, encoding: .utf8) ?? "Error")")

