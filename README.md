LruCache
========

[![Carthage compatible][carthage-image]][carthage-url]
[![License][license-image]][license-url]

Least Recently Used.  
in-memory LRU cache with a maximum item count of 10.

## Requirements

- Swift 2 beta 6
- iOS 8.0 or later

## Usage

```swift
var cache: LruCache<String, Int> = LruCache()
cache["a"] = 1
cache["b"] = 2
cache["c"] = 3

let v = cache["a"] // Optional(1)
```

## Installation

### [Carthage](https://github.com/Carthage/Carthage)
Add the following to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile):

```
github "to4iki/LruCache"
```

Run `carthage update` and follow the steps as described in Carthage's [README](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application).


## Author

[to4iki](https://github.com/to4iki)

## Licence

[MIT](http://to4iki.mit-license.org/)

[carthage-url]: https://github.com/Carthage/Carthage
[carthage-image]: https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat

[license-url]: http://to4iki.mit-license.org/
[license-image]: http://img.shields.io/badge/license-MIT-brightgreen.svg
