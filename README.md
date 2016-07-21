# Lockable ScrollView for React Native

## Why?

Sometimes you want to add something to the top of a ScrollView, but you don't want to lose the scroll position.

So lock the scroll position! When the size of the content in LockableScrollView changes and it is locked, it will shift the scroll position by the difference in height. So you can have buttery smooth infinite scrolling both downwards and upwards.

## How?

The API is same as ScrollView, with addition to one instance method:

`lockBottomScrollOffset()`

This will wait until the content changes (for example by you calling `setState`) and restores the scroll position.

## Some examples?

```javascript
import React, { Component } from 'react';
import {
  AppRegistry,
  View,
  Text,
  TouchableOpacity
} from 'react-native';
import LockableScrollView from './LockableScrollView';

class InfiniteScroll extends Component {
  constructor(props) {
    super(props);

    this.scrollView = null;

    this.state = {
      numberOfItems: 20,
    };
  }

  render() {
    return (
      <View
        style={{
          flex: 1,
          paddingTop: 20,
          alignItems: 'stretch',
          position: 'relative',
        }}
      >
        <LockableScrollView
          ref={sv => this.scrollView = sv}
        >
          {this.renderItems()}
        </LockableScrollView>
        {this.renderButton()}
      </View>
    );
  }

  renderItems() {
    const {numberOfItems} = this.state;
    const items = [];

    for (let i = numberOfItems; i > 0; i--) {
      items.push(
        <View key={i} style={{height: 50}}>
          <Text>Item #{i}</Text>
        </View>
      );
    }

    return items;
  }

  renderButton() {
    return (
      <TouchableOpacity
        onPress={() => this.addMoreItems()}
        style={{
          position: 'absolute',
          bottom: 10,
          left: 10,
          right: 10,
          height: 50,
          flex: 0,
          flexDirection: 'row',
          justifyContent: 'center',
          alignItems: 'center',
          backgroundColor: 'red',
        }}
      >
        <Text>Add more items</Text>
      </TouchableOpacity>
    );
  }

  addMoreItems() {
    // this is the most important part
    // we are adding something to the top of the view
    // and we lock the offset before in order to not
    // lose the scroll position
    
    this.scrollView.lockBottomScrollOffset();

    this.setState({
      numberOfItems: this.state.numberOfItems + 10
    });
  }
}

AppRegistry.registerComponent('InfiniteScroll', () => InfiniteScroll);
```
