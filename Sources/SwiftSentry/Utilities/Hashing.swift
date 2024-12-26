import Foundation
import SHA2

extension Data {
  var sha256: Data {
    let hash = SHA256(hashing: self)
    return Data(hash)
  }

  var hexString: String { map { String(format: "%02x", $0) }.joined() }
}
