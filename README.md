# NY Times Most Popular Articles

Build a simple app to hit the NY Times Most Popular Articles API and show a list of articles, that shows details when items on the list are tapped (a typical master/detail app). 


## Features
- Fetches and displays a list of Most Popular Articles from the NY Times API.


## Architecture
The app follows the MVVM architecture pattern and is fully developed in Swift.


## Testing
The app includes unit tests to ensure the correctness of its components and features. The tests can be run using Fastlane, which provides automation for building, testing, and deploying iOS apps. Fastlane actions can execute the unit tests and generate test reports.

### Prerequisites
Before running the unit tests using Fastlane, make sure you have the following:

- Xcode installed on your machine.
- Fastlane installed globally on your machine.

### Running Unit Tests with Fastlane
To run the unit tests and generate test reports using Fastlane, follow these steps:

1. Open a terminal and navigate to the root directory of the NYTimes project.
2. Run the following command to execute the unit tests:

```
fastlane run_tests
```
This command will build the app, run the unit tests, and generate test reports.

## Environment
- Swift 5
- iOS 15+
- XCode 14.2

