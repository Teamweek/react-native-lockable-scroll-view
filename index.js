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

    this.scrollResponderScrollTo = ({x, y, animated}) => {
      UIManager.dispatchViewManagerCommand(
        this.scrollResponderGetScrollableNode(),
        UIManager.TWLockableScrollView.Commands.scrollTo,
        [x || 0, y || 0, animated !== false],
      );
    };
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
  'TWLockableScrollView',
  LockableScrollView, {
    nativeOnly: {
      onMomentumScrollBegin: true,
      onMomentumScrollEnd : true,
      onScrollBeginDrag: true,
      onScrollEndDrag: true,
    }
  }
);

export default LockableScrollView;
