**How to use the customized TwitterKit pod**
```
pod 'TwitterKit5'
```

## Build instructions
1. Delete the `Package.swift` file (save its contents somewhere as we will restore it at the end).
2. Create a folder `output` on the project directory.
3. Navigate inside the `TwitterKit` folder on the terminal.
4. Archive the project for the simulator
  ```
  xcodebuild archive \
  -scheme TwitterKit \
  -archivePath ../output/TwitterKit-iphonesimulator.xcarchive \
  -sdk iphonesimulator \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES
  ```
4. Archive the project for the iPhone
  ```
  xcodebuild archive \
  -scheme TwitterKit \
  -archivePath ../output/TwitterKit-iphoneos.xcarchive \
  -sdk iphoneos \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES
  ```
5. Navigate to the root project folder.
6. Create XCFramework zip file
  ```
  xcodebuild -create-xcframework \
 -framework output/TwitterKit-iphonesimulator.xcarchive/Products/Library/Frameworks/TwitterKit.framework \
 -framework output/TwitterKit-iphoneos.xcarchive/Products/Library/Frameworks/TwitterKit.framework \
 -output output/TwitterKit.xcframework
 ```
7. Create a **.zip** file from the resulting **TwitterKit.framework** directory.
7. Create a [new release](https://github.com/Alqueraf/twitter-kit-ios/releases/new) on the repository.
8. Upload the `TwitterKit.xcframework.zip` file.
9. Add the `Package.swift` file again.
10. Inside `Package.swift`, update the **url** value of the binary target to match the URL of the new zip release in GitHub.
11. Get the SHA256 of the zip file
  ```
  shasum -a 256 TwitterKit.xcframework.zip
  ```
12. Inside `Package.swift`, update the **checksum** value of the binary target with the result from the previous command.
15. Update your project's Swift Package Manager dependencies.

# Twitter Kit for iOS

## Background

Twitter Kit is a native SDK to include Twitter content in mobile apps. Twitter Kit is designed to make interacting with Twitter seamless and efficient.

Using Twitter Kit from source in production applications is not officially supported. Please utilize the official binaries released via [CocoaPods](https://cocoapods.org/pods/TwitterKit) or [Carthage](https://github.com/Carthage/Carthage).

## Twitter Kit Features

* Display Tweets and timelines
  * Native views to display Tweets in alignment with Twitter's display guidelines.
  * Timeline adapters for displaying collections, lists, and profile timelines from the Twitter API
  * Search result timelines using the Search API, with additional client-side filter capability
* Compose Tweets
  * Share Tweets with text, URLs, photos and video.
  * Automatically handles API access and login for quick sharing.
* Monetize with MoPub integration
  * Easy integration of MoPub's display ads tools with Twitter content.
* Log in with Twitter
  * Authorize users, using the Twitter accounts already on their phone.
  * Support for requesting email address
* Access the Twitter API
  * API client for all interactions with the Twitter API.

## Components of Twitter Kit iOS

* TwitterCore
  * Network calls are handled
* TwitterKit
  * Tweet display
* TwitterShareExtensionUI
  * Tweet composer 

## Installation

### Get started

* Generate your Twitter API keys through the [Twitter developer apps dashboard](https://apps.twitter.com/).
* Install Twitter Kit using instructions below.
* For extensive documentation, please see the official [documentation](https://github.com/twitter/twitter-kit-ios/wiki).
	
### Install using Cocoapods

To add Twitter Kit to your app, simply add `TwitterKit` to your Podfile.

```ruby
target 'MyApp' do
  use_frameworks!
  pod 'TwitterKit'
end
```

### Preview Twitter Kit Features in the Demo App

Twitter Kit includes a demonstration app allowing you to preview features, and verify functionality. Create Twitter API keys as above, and then:

* To check out a demo app with features already built in, rename `DemoApp/Config.xcconfig.sample` to `DemoApp/Config.xcconfig` and populate the consumer key and secret.
* Run `DemoApp.xcworkspace` on Xcode to verify build.

## Code of conduct

This, and all github.com/twitter projects, are under the [Twitter Open Source Code of Conduct](https://github.com/twitter/code-of-conduct/blob/master/code-of-conduct.md). Additionally, see the [Typelevel Code of Conduct](http://typelevel.org/conduct) for specific examples of harassing behavior that are not tolerated.

## Contribution

The master branch of this repository contains the latest stable release of Twitter Kit.

Twitter Kit can be used as a dependency for substantial other work, and we welcome fixes and enhancements to the core libraries as well. See [CONTRIBUTING.md](https://github.com/twitter/twitter-kit-ios/blob/master/CONTRIBUTING.md) for more details about how to contribute.

## Contact

For usage questions post on [Twitter Community](https://twittercommunity.com/tags/c/publisher/twitter/ios).
Please report any bugs as [issues](https://github.com/twitter/twitter-kit-ios/issues).
Follow [@TwitterDev](http://twitter.com/twitterdev) on Twitter for updates.

## License

Copyright 2017 Twitter, Inc.
Licensed under the Apache License, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0
