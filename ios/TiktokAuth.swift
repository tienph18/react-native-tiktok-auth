import Foundation
import TikTokOpenAuthSDK

@objc(TiktokAuth)
class TiktokAuth: NSObject {

  @objc
    func auth(_ callback: @escaping RCTResponseSenderBlock) {
      let authRequest = TikTokAuthRequest(
        scopes: ["user.info.basic"],
        redirectURI: "https://preview.metafox.app/"
      )

      DispatchQueue.main.async {
        authRequest.send { response in
          guard let authResponse = response as? TikTokAuthResponse else { return }
          print("authResponse---", authResponse)
        }
      }
    }
}
