import UIKit

/*:
 # Obfuscation functions
 
 Este playground muestra un ejemplo de función de ofuscación para una cadena de texto. Se está simulando la ofuscación de una public key.
###  Table of contents
- Función de ofuscación
- Función de desofuscación
- Ejemplo de uso
 
 ![Obfuscating](obfuscating.png)
 */

//: ## Función de ofuscación
private func obfuscatePublicKey(publicKey: [UInt8]) -> String {
    publicKey.reduce("") { (result, char) -> String in
        let comma = result == "" ? "" : ","
        let numberFrom0ToChar = UInt8(Int.random(in: 0...Int(char)))
        switch Int.random(in: 0...1) {
        case 0:
            let numberToChar = char - numberFrom0ToChar
            return "\(result)\(comma)\(String(format: "0x%02X", numberFrom0ToChar))\(String(format: "+0x%02X", numberToChar))"
        default:
            return "\(result)\(comma)\(String(format: "0x%02X", char + numberFrom0ToChar))\(String(format: "-0x%02X", numberFrom0ToChar))"
        }
    }
}

//: ## Función de desofuscación
private func deobfuscatePublicKey(obfuscatedPublicKey: [UInt8]) -> String {
    guard let deobfuscatedPublicKey = String(data: Data(obfuscatedPublicKey), encoding: .utf8) else {
        return ""
    }
    return deobfuscatedPublicKey
}


//: ## Ejemplo de uso
let publicKey = "lcBK1t5im9/sPg+rk7SN1DzEFoh/csZIPCMKbFt7RNQ="
// "lcBK1t5im9/sPg+rk7SN1DzEFoh/csZIPCMKbFt7RNQ="
let publicKeyByteArray = [UInt8](publicKey.utf8)
// Obfuscate public key
let obfuscatedPublicKey = obfuscatePublicKey(publicKey: publicKeyByteArray)
print("Obfuscated public key: \(obfuscatedPublicKey)")

// Deobfuscate public key
let obfuscatedPublicKeyArray: [UInt8] = [0x5F+0x0D,0x94-0x31,0x4B-0x09,0x7D-0x32,0x50-0x1F,0x0A+0x6A,0x2E+0x07,0x96-0x2D,0xAE-0x41,0x09+0x30,0x3E-0x0F,0xD1-0x5E,0x7D-0x2D,0x5D+0x0A,0x44-0x19,0xB2-0x40,0x92-0x27,0x35+0x02,0x7D-0x2A,0x64-0x16,0x09+0x28,0x49-0x05,0x24+0x56,0x79-0x34,0x83-0x3D,0x58+0x17,0x5F+0x09,0x06+0x29,0x59+0x0A,0xD7-0x64,0x77-0x1D,0x17+0x32,0x0C+0x44,0x82-0x3F,0x11+0x3C,0x45+0x06,0x64-0x02,0x0B+0x3B,0xE8-0x74,0x2A+0x0D,0x0C+0x46,0x61-0x13,0x7A-0x29,0x6C-0x2F]
let deobfuscatedPublicKey = deobfuscatePublicKey(obfuscatedPublicKey: obfuscatedPublicKeyArray)
print("Deobfuscated public key: \(deobfuscatedPublicKey)")

