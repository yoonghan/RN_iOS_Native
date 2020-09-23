/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React from 'react';
import {
  StatusBar,
  SafeAreaView,
  StyleSheet,
  View,
  Text
} from 'react-native';
import CustomView from './CustomView.js';

const App: () => React$Node = () => {
  const [status, setStatus] = React.useState(false)
  const [text, setText] = React.useState("Sample Text")

  const onClick = (event) => {
    alert("Received params: " + JSON.stringify(event))
    setStatus(!status)
    setText("New Text")
  }

  return (
    <>
      <StatusBar barStyle="dark-content" />
      <SafeAreaView style={styles.container}>
          <CustomView
            text={text}
            status={status}
            onClick={onClick}
            style={{ width: 100, height: 100 }}
          />
          <View>
            <Text>Welcome to React Native!</Text>
          </View>
      </SafeAreaView>
    </>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  }
});

export default App;
