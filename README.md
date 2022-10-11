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
</p>

## ✦ Project
<p align="justify">
This repository was created to be a mobile project that uses the Reso Coder's Flutter Clean Architecture Proposal™ with GetX support to make an project with authentication features and good practices as the clean code, SOLID and conventional commits. This project must be a base for my future projects.
</p>

## ✦ Technologies
Esse projeto foi desenvolvido com as seguintes tecnologias:
- [Flutter]([https://flask.palletsprojects.com/en/1.1.x/](https://flutter.dev/))
- [Dart]([https://getbootstrap.com/](https://dart.dev/))
- [Dartz](https://pub.dev/packages/dartz)
- [GetX](https://pub.dev/packages/get)

## ✦ Overview
<p align="justify">
This repository was created to be a mobile project that uses the Reso Coder's Flutter Clean Architecture Proposal™ with GetX support to make an project with authentication features and good practices as the clean code, SOLID and conventional commits. This project must be a base for my future projects.
</p>

![clean_diagram](https://user-images.githubusercontent.com/32853995/194931703-4ba7e856-fe0f-4a4f-b3d8-04372c3a4441.png)

<h2>Presentation</h2>

<p align="justify">
The above diagram explain how each elements work and the call stack flow. Anyway, in the top of the flow, we have the presentation layer that is responsable for get and show data information from/to users through UI/UX. 
</p></br>

<p align="justify">
In this project, each view have your own GetXController that manage all states and actions it has, encapsulating all logic and behaviour from the Widgets as exemplified in the image from splash feature below:
</p>


![getx_controller](https://user-images.githubusercontent.com/32853995/194935614-da1a0060-40f6-4e13-9815-c3a9c07d4c01.png)

<h2>Domain</h2>

<p align="justify">
Under the presentation layer we've the domain layer, responsable for contain our usecases, entities and repositories. But, of course, our presentation can only "see" the usecases. The usecases in turn can use repositories and entities (but without known what is implemented, just as contracts, it keeps our project clean.) futhermore is responsable for contain our core logic to their own context. The entities are an abstract representation of our objects. The repositories are at the same time on the domain layer and data layer but, in the domain, we just implement the contract, it defines the repository interface that should be used by usecases.
</p>

<h2>Data</h2>

<p align="justify">
The data layer is composed for all data fetch mechanisms as repositories, view models, local and remote datasources. The repository in this layer have to implement the domain interface and override the previously declared functions and decide when to use the remote and local datasource and return or a failure or the result. Our view models extends our entities and implement parser functions like Json to Object, it helps to return always what we want from repositories. Finally, our datasources fetch the data, in other words, we explicity do the requisitions from cache or remote client and return the result or throw an error.
</p>

<h2>Core</h2>

<p align="justify">
Besides the features, I created a core path that contains all shared content between features as errors, mixins, routes and common widgets.
</p>

<h2>Dependency Injection</h2>

<p align="justify">
The dependency injection follows the diagram, in other words, datasources are injected on repositories, repositories are injected on usecases and usecases are injected on the presentation controller. GetX made it easy, fortunately.
</p>

<h2>Feature example (Splash)</h2>
<p align="justify">
It is coincidence? jaja!!
</p>

![splash_feature](https://user-images.githubusercontent.com/32853995/194959994-3e9ae1da-b1e6-45dc-ba18-f055387069a6.png)

## ✦ Implemented Views
<p align="justify">
The following images are from the authentication and splash features
</p>

<p align="center">  
    <img alt="Tela 1" title="App" src="lib/assets/readme/splash_page.png" width="70%"/>
    <img alt="Tela 2" title="App" src="lib/assets/readme/login_page.png" width="70%"/>
    <img alt="Tela 3" title="App" src="lib/assets/readme/register_page.png" width="70%"/>
</p>

---
<p align="justify">
Just fork it.
</p>
