# Description
A demo app that demonstrates Flutter's ability to create beautiful UI with complex animations.
The app fetches recipes from local storage.

## 📦 Packages 
| Description    |   Package |
| ---------| -------|
| Architecture | Reference Architecture|
| State Management | [flutter_riverpod](https://pub.dev/packages/flutter_riverpod)
| Theming | [flex_color_scheme](https://pub.dev/packages/flex_color_scheme) |
| animation | [flutter_animate](https://pub.dev/packages/flutter_animate) & explicit animation |

 
## 🩻 Project Structure  

```
|- assets <- recipe.json and images
|
lib
|
|_ 📁src
	|
	|__ 📁core
	|	|__ 📁animation <- page transition
	|	|__ 📁constants
	|	|__ 📁theme <- define themes & and color platte
	|	|__ 📁widgets <- widgets that are used in multiple screens
	|
    |__ 📁onboarding <- onboarding screen and its widgets
    |
    |__ 📁recipes 
        |__ 📁domain <- entities
        |__ 📁data <- recipe repository (fetch recipes from recipe.json)
        |__ 📁presentation <- Home Screen & Recipe Details Screen and other related widgets
```


## 🗞️ License
MIT License

