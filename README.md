[![CI](https://github.com/wesley-crick/flutter-mvi-base/actions/workflows/main.yml/badge.svg)](https://github.com/wesley-crick/flutter-mvi-base/actions/workflows/main.yml)

# Flutter MVI Base

A Flutter application that implements MVI architecture and common libraries.

## Getting Started

Download dependencies with: `flutter pub get`
Build generated files with: `flutter pub run build_runner build`

## Libraries
 - Loggy: A structured way to log through out the application.
 - GetX: The core for the MVI framework. Includes dependency injection, reactive stream, and navigation.
 - Dio/Retrofit: Network requests.
 - ObjectBox: An object database.

## Definitions
 - Page: A GetX page that holds a view and that view's dependencies.
 - View: Contains UI and processes state changes.
 - View Model: Processes the actions sent from the view, update state, and emit events.
 - State: A data object for the UI.
 - Action: The intent being sent from the view to the view model.
 - Event: A separate emissions from the view model, generally for navigation or displaying snackbars.
 - Repository: Get data from network or database.
 - Use Case: Convert DTOs or DAOs from 1 or more repositories to an object the view can use.
 - Data Transfer Object (DTO): Response from the network.
 - Data Access Object (DAO): Data object returned from the database.

## Architecture

Model-View-Intent(MVI) is an architecture that follows a single cyclic path. 

View --> View Model <--> Repository
     <--
