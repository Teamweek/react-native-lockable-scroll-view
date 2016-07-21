import React from 'react';
import {
  ScrollView,
  requireNativeComponent,
  findNodeHandle,
  UIManager
} from 'react-native';

class LockableScrollView extends ScrollView {
  constructor(props) {
    super(props);
  }

  render() {
    const element = super.render();

    return (
      <TWLockableScrollView
        {...element.props}
        ref={element.ref}
      />
    );
  }

  lockBottomScrollOffset() {
    UIManager.dispatchViewManagerCommand(
      findNodeHandle(this),
      UIManager.TWLockableScrollView.Commands.lockBottomScrollOffset,
      []
    );
  }
}

LockableScrollView.propTypes = ScrollView.propTypes;

const TWLockableScrollView = requireNativeComponent(
  'TWLockableScrollView', LockableScrollView);

export default LockableScrollView;
