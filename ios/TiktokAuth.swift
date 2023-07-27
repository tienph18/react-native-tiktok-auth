import Foundation
import TikTokOpenAuthSDK

@objc(TiktokAuth)
class TiktokAuth: NSObject {

  @objc
    func auth(_ callback: @escaping RCTResponseSenderBlock) {
      let authRequest = TikTokAuthRequest(
        scopes: ["user.info.basic"],
        redirectURI: "https://www.example.com/path"
      )

      DispatchQueue.main.async {
        request.send(self, completion: { resp -> Void in
          callback([
            ["status": resp.errCode.rawValue, "code": resp.code]
          ])
        })
        authRequest.send { response in
          let authResponse = response as? TikTokAuthResponse else { return }
          if authResponse.errorCode == .noError {
            print("Auth code: \(authResponse.code)")
            callback([
              ["status": authResponse.errorCode.rawValue, "code": authResponse.code]
            ])
          } else {
  //           print("Authorization Failed!
  //             Error: \(authResponse.error ?? "")
  //             Error Description: \(authResponse.errorDescription ?? "")")
          }
        }
      }
    }
}
