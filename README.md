# StashCoach

![ScreenShot](https://raw.github.com/4dot/StashCoach/master/Docs/architecture.png)

## AchievementInterface
```swift
protocol AchievementWireframeInterface: WireframeInterface {
    // Route to other view
    func navigate(to option: AchievementNavigationOption)
}

protocol AchievementViewInterface: ViewInterface {
    // View update
    func updateData(_ title: String)
}

protocol AchievementPresenterInterface: PresenterInterface {
    // Access to Achievements
    func numberOrItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> Achievement?
    func didSelectItem(at indexPath: IndexPath)
}

protocol AchievementInteractorInterface: InteractorInterface {
    // Communicate with network module
    func retrieveAchievement(_ complete: @escaping AchievementListCompletionBlock)
}
```
## Communication and references

- AchievementViewController communicates with AchievementPresenter via a AchievementPresenterInterface protocol
- AchievementPresenter communicates with AchievementViewController via a AchievementViewInterface protocol
- AchievementPresenter communicates with AchievementInteractor via a AchievementInteractorInterface protocol
- AchievementPresenter communicates with AchievementWireframe via a AchievementWireframeInterface protocol

The communication between most components of a module is done via protocols to ensure scoping of concerns and testability. Only the Wireframe communicates directly with the Presenter since it actually instantiates the Presenter, Interactor and View and connects the three via dependency injection.

- AchievementPresenter has a strong reference to AchievementInteractor
- AchievementPresenter has a strong reference to AchievementWireframe
- AchievementPresenter has a unowned reference to AchievementViewController
- AchievementViewController has a strong reference to AchievementPresenter

## Useful links
- https://github.com/infinum/iOS-VIPER-Xcode-Templates
- https://www.objc.io/issues/13-architecture/viper/

