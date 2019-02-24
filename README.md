# GYGReviews Sample Application
[![Build Status](https://app.bitrise.io/app/997036c43511796c/status.svg?token=uhsqCBE0-srgISpb5Ncrpg)](https://app.bitrise.io/app/997036c43511796c)
<br><br>

## Architecture
- This project is based on MVVM-C trying to respect the SOLID and Clean Architecture principles.
- The ViewModel is different in this architecture because she doesn't have business logic, her responsibility is only abstract the business model data into a struct that only makes sense to the presentation layer, trying not to expose those businesses model information at viewController.
- The layers into this architecture respect a unidirectional flow (viewController -> Interactor -> Presenter -> ViewController), this helps to prevent reference cycles.
<br><br>
![](https://i.imgur.com/k3a08L6.png)

## Third party frameworks
 - The only third party framework is <b>Cosmos</b> to handle with the stars rating view.

## Continuous Integration
- This repository is integrated with `Bitrise` what means that every time that a pull request is open to the `master` branch the CI will run a build and the tests for the Pull Request, also when a merge occurs with the master the CI will run the build and the tests.
- The `Bitrise` label at this readme file shows quickly if the `master` is broken or if everything is fine(tests and build).

## Unit Tests
Were implemented Unit Tests for:
- Coordinator
- ReviewsManager
- ReviewsListPresenter
- ReviewsListInteractor

## Things To Improve
- [ ] Remove the hardcoded `count` amount that pass to the APIService request a value of `1000` that makes the application loads all the available reviews before presents.
- [ ] Implement a infinite scroll its a good alternative for the problem above, as the Interactor will request the next reviews page every time the user scrolls the tableView to the end, this will happens while still have a valid page at the service.
- [ ] Another Alternative is create a "load more" button at the tableview footer, to let the user decide when to load more reviews.
- [ ] Implements a option to sort the reviews by: date, rates, countries and users name.
- [ ] Implements UI tests.
- [ ] Improve the application UI and makes more elegant.
 
## Requirements
- Xcode 10.1
- Swift 4.2
- Cocoapods 1.5.3

## Instructions
```bash
$ git clone https://github.com/judarlima/GYGReviews.git
$ cd GYGReviews
$ pod install
$ open GYGExample.xcworkspace
```
