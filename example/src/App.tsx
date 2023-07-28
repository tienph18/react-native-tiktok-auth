import * as React from 'react';

import { StyleSheet, View, TouchableOpacity } from 'react-native';
import { auth } from 'react-native-tiktok-auth';

export default function App() {
  React.useEffect(() => {
    //
  }, []);

  const handlePress = () => {
    console.log('press auth button');
    auth((code, error, errMsg) => {
      console.log('auth callback---', code, error, errMsg);
    });
  };

  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.button} onPress={handlePress} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  button: {
    width: 60,
    height: 60,
    marginVertical: 20,
    backgroundColor: 'red',
  },
});
