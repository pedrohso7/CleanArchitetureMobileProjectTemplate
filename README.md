![✪_Clean_Architeture_Mobile_Project](https://user-images.githubusercontent.com/32853995/195160163-43688868-03d8-41cb-8dc9-50f03d52ab14.png)

<div align="center">
          
[![GitHub forks](https://img.shields.io/github/forks/pedrohso7/mobileCleanProjectTemplate)](https://github.com/pedrohso7/mobileCleanProjectTemplate/network)
</div>
          
<p align="center">
  <a href="#-project">Project</a>
  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-technologies">Technologies</a>
  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-overview">Overview</a>
  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-implemented-views">Implemented Views</a>
  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-usage">Usage</a>
</p>

## ✦ Project
<p align="justify">
This repository was created to be a mobile project that uses the <a href="https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure">Reso Coder's Flutter Clean Architecture Proposal™</a> using the current most popular technologies and approach's to make an project with a built-in authentication features made using good practices as clean code, SOLID and conventional commits. This project must be the base for my future projects.
</p>

## ✦ Technologies
This project was made using the tecnologies below:
- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- [Flutter Modular](https://pub.dev/packages/flutter_modular) to dependency injection and routing. This package allows us to use a smart and modularized Structure to inject depencies and define routes. This way we improove understanding of features, faces less breaking changes and improve reuse.
- [Flutter BLoC](https://pub.dev/packages/flutter_bloc) to the page's state management. BLoC allows for a clear separation between the UI components and the business logic and this helps to organize code and making it more maintainable and testable.
- [Mockito](https://pub.dev/packages/mockito) as the Mock support to our tests.
- [Flutter Tests](https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html) the native option to make app unit tests.
- [Get_Storage](https://pub.dev/packages/get_storage) as our local storage.
- [Firebase](https://firebase.google.com/docs/reference/rest/auth) Rest API to authentication because we will not need to add any dependency.

## ✦ Overview
<p align="justify">
This project can be a good start to make your own app. The lib folder comports all our functionalities, being divided in core folder (common resources) and app folder (our features):
</p>

<p align="middle">
<img alt="App content" title="App" src="https://github.com/pedrohso7/CleanArchitetureMobileProjectTemplate/assets/32853995/cc383d43-77dc-41be-8a17-48b72d526777" width="200"/>
</p>

<p align="justify">
The following content explains how each feature was structured.
</p>

<p align="middle">
<img alt="App Architeture" title="App" src="https://user-images.githubusercontent.com/32853995/194931703-4ba7e856-fe0f-4a4f-b3d8-04372c3a4441.png" width="385"/>
</p>

<p align="justify">
The auth feature will be used as example across this explanation.
</p>

<h4>Presentation</h4>

<p align="justify">
In top of flow, we have the presentation layer. It includes the UI components such as widgets, pages and presenters. Futhermore, the layer is responsible for rendering the user interface and handle user actions.

The presenter separation makes the UI code more maintainable and testable because it removes the Business Logic from the UI behaviour, avoiding coupled code's.
</p>

<p align="justify">
The project presentation layer's are divided in bloc, stateless widget's and the presenter orchestror file, a stateful widget that can uses native Flutter lifecycle and handles all other organisms:
</p>

<p align="middle">
<img alt="Presentation structure" title="App" src="https://github.com/pedrohso7/CleanArchitetureMobileProjectTemplate/assets/32853995/a89586fc-76b3-41c4-a2fc-adf6b40f7b96" width="385"/>
</p>

<p align="justify>
Each feature presentation folder define their own bloc folder. It defines the state variations, action types and the action's handling. The screens and widgets folders provides the stateless widgets available for feature and the "presenter" file is the orchestror.
</p>

<h4>Domain</h4>

<p align="justify">
Under the presentation layer on stack flow we've the domain layer. This layer basically contains business logic and entities. It represents the core functionality of the feature and has to be independent of any external elements. Build our domain like this helps to make the business logic independent of the UI and data sources:
</p>

<p align="middle">
<img alt="Domain structure" title="App" src="https://github.com/pedrohso7/CleanArchitetureMobileProjectTemplate/assets/32853995/1a3d65ae-e4c6-49a8-84f6-7a3a8fb8ff50" width="385"/>
</p>

The related folders are used to:
<ul>
<li><b>usecases</b>: Contains the application-specific business rules or use cases. These use cases represent the actions that can be performed within the application.</li>
<li><b>protocols</b>: Includes the interfaces or abstract classes that define the methods for data operations. These interfaces are implemented in the data layer, in repositories.</li>
<li><b>entities</b>: Holds the core data models or entities that represent the business objects and data structures used within the feature</li>
</ul>

<h4>Data</h4>
This layer deals with data handling, including data sources, repositories, models and remote data providers. It is responsible for retrieving and storing data from external sources such as databases, APIs, or repositories. It Abstracts the data sources and provides a unified interface to access and manipulate data. By separating data handling from the rest of the application, it allows us to isolate and manage data easier, swap data source if needed and data manipulation without impacting the business logic.


<p align="middle">
<img alt="Data structure" title="App" src="https://github.com/pedrohso7/CleanArchitetureMobileProjectTemplate/assets/32853995/4f5b6351-c3be-4824-9d4b-f9f3042fdaee" width="385"/>
</p>

The data folders are:
<ul>
<li><b>datasources</b>: Contains classes responsible for interacting with remote data sources such as APIs or web services.</li>
<li><b>repositories</b>: Implements the interfaces defined in the domain layer. These concrete implementations handle data operations and serve as the bridge between the domain layer and external data sources.</li>
<li><b>models</b>: Holds the data models (derived from domain entities) that represent the data structures used for data manipulation within the application</li>
</ul>

<h4>Core</h4>

<p align="justify">
Besides the features, I created a core path that contains all shared components used across the application as errors, mixins, extensions, constants and common widgets:
</p>

<p align="middle">
<img alt="Core folder" title="App" src="https://github.com/pedrohso7/CleanArchitetureMobileProjectTemplate/assets/32853995/91522a1c-91f6-44d2-9e75-ac839f1d3ddd" width="450"/>
</p>

<h4>Dependency Injection</h4>

<p align="justify">
The dependency injection follows the diagram on the beggining of this document, in other words, datasources are injected on repositories, repositories are injected on usecases and usecases are injected on the presentation. Modular made it easy, fortunately.
</p>

<p align="justify">
Is it coincidence?
</p>

<p align="middle">
<img alt="Auth feature injection" title="App" src="https://github.com/pedrohso7/CleanArchitetureMobileProjectTemplate/assets/32853995/742e3ab2-7ea3-4255-86a4-1d28ca8b899a" width="350"/>
</p>

<h2>Home feature injection example</h2>

<p align="middle">
<img alt="Auth feature injection" title="App" src="https://github.com/pedrohso7/CleanArchitetureMobileProjectTemplate/assets/32853995/8d3aa447-3764-456a-86d0-a1dd2e093099" width="500"/>
</p>

<p align="justify">
You can implement as dependency just the what you feature needs. Modular will factory and dispose it automatically when the navigation actions triggers something.
</p>

## ✦ Implemented Views
<p align="justify">
The following images are from the authentication features (Home isn't listed because is just a simple page structure and will be replaced on other projects):
</p>

<p align="middle">          
<!-- <img alt="Splash View" title="App" src="https://github.com/pedrohso7/CleanArchitetureMobileProjectTemplate/assets/32853995/f6b00ee6-68bf-46b3-a8e8-5713569f71af" width="200"/> -->
<img alt="Login View" title="App" src="https://github.com/pedrohso7/CleanArchitetureMobileProjectTemplate/assets/32853995/a5611dda-bcfe-4ea2-b1ef-83d08e84cf74" width="200"/>
<img alt="Register View" title="App" src="https://github.com/pedrohso7/CleanArchitetureMobileProjectTemplate/assets/32853995/a1f07ea1-8e9a-400b-ace0-888930b8c317" width="200"/>
<img alt="Reset Password View" title="App" src="https://github.com/pedrohso7/CleanArchitetureMobileProjectTemplate/assets/32853995/77ff5de3-6119-491b-b81c-af3bd224f7a9" width="200"/>
</p>

## ✦ Usage
<p align="justify">
To start using this template, fork this repo and start using. Make sure you created your .env on root path following .env.example. You need to follow the Firebase project's configuration configs to get your own firebase web key. After this, run the following command in the root path to start the proceed:
</p>

```
flutter pub get
```

<p align="justify">
You got the dependencies and, now, run the app using:
</p>

```
flutter run
```

<p align="justify">
Instead of this you can also generate your apk build and run in your own device with:
</p>

```
flutter build apk
```

## ✦ Start to use

<p align="justify">
Just fork it.
</p>
