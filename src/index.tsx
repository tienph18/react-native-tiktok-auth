import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-tiktok-auth' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

enum TikTokAuthResponseErrorCode {
  noError = 0,
  common = -1,
  cancelled = -2,
  failed = -3,
  denied = -4,
  unsupported = -5,
  missingParams = 10005,
  unknown = 100000,
}

type ResponseType = {
  authCode?: string;
  errorCode: TikTokAuthResponseErrorCode;
  errorDescription?: string;
};

const TiktokAuth = NativeModules.TiktokAuth
  ? NativeModules.TiktokAuth
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export const auth = (
  callback: (
    authCode: string,
    error: TikTokAuthResponseErrorCode,
    errMsg?: string
  ) => void
) => {
  const scopes = 'user.info.basic';
  const redirectUri = 'https://preview.metafox.app/';

  TiktokAuth.auth(scopes, redirectUri).then(async (resp: ResponseType) => {
    if (resp) {
      callback(resp.authCode || '', resp.errorCode, resp.errorDescription);
    }
  });
};
