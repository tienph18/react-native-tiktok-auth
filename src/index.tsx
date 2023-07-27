import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-tiktok-auth' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

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
  callback: (code: string, error: boolean | null, errMsg: string) => void
) => {
  TiktokAuth.auth((resp) => {
    if (Platform.OS === 'ios') {
      callback(resp.code, false, '');
    } else {
      callback('', null, '');
    }
  });
};
