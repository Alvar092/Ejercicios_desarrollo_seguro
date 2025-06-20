import UIKit

/*:
 # Conversión hexadecimal
 
 Este playground muestra un ejemplo de conversión en base 16.
###  Table of contents
- Función para convertir datos en un string en formato hexadecimal.
- Función para convertir un string en hexadecimal a datos
- Ejemplos de uso
 
 ![Hex conversion](hex.png)
 */
//: ## Datos a hex string
func dataToHexString(data: Data) -> String {
    return data.map { String(format: "%02X", $0) }.joined()
}
//: ## Hex string a datos
func hexStringToData(hexString: String) -> Data? {
    var hex = hexString
    hex = hex.replacingOccurrences(of: " ", with: "")
    hex = hex.replacingOccurrences(of: "\n", with: "")

    var data = Data(capacity: hex.count / 2)
    
    var index = hex.startIndex
    while index < hex.endIndex {
        let byteString = String(hex[index ..< hex.index(index, offsetBy: 2)])
        if let byte = UInt8(byteString, radix: 16) {
            data.append(byte)
        } else {
            return nil
        }
        index = hex.index(index, offsetBy: 2) 
    }
    
    return data
}
//: ## Ejemplos de uso
let data = "Hello, world!".data(using: .utf8)!
let hexString = dataToHexString(data: data)
print("Hex string:", hexString)
let restoredData = hexStringToData(hexString: hexString)
print("Restored data:", String(data: restoredData!, encoding: .utf8) ?? "nil")
