import React from 'react';
import { requireNativeComponent } from 'react-native';

type Props = {
  text: String,
  status: Boolean,
  onClick: Function
}

//Check naming must be same as objective-C name
const RCTCustomView = requireNativeComponent('RCTCustomView', CustomView, {});

class CustomView extends React.PureComponent<Props> {
  _onClick = (event) => {
    if (!this.props.onClick) {
      return;
    }

    // process raw event...
    this.props.onClick(event.nativeEvent);
  }

  render() {
    return <RCTCustomView {...this.props} onClick={this._onClick}/>
  }
}

export default CustomView;
