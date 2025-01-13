# Project

Sample project about list/detail view application. Unlike the classical note application, this application provides different features:
- favorite
- filtering by favorite
- showing a meditation detail
- playing the audio

## Installation Requirements & Versions

- Xcode: 16.0
- Swift: 6.0
- iOS: 17.6

Compatible only with iPhone at the moment, to keep the design as small as possible.

## Project Architecture

To keep this project focused on the view implementation, I decided to keep a simple architecture. This project does not have a MVVM implementation, because it makes less sense when using the SwiftData framework.

## Views

The different views are managed on the "Screen" view, making the backgrounds never changed when navigating.

### List

Display a meditation list where it is possible to either: play the file, set it as favorite and display the detail

### Detail

Display the meditation detail, including the transcript of the audio. Still possible to play the file, set it as favorite.

### TODO

[v] display list view
[v] display detail view
[v] add SwiftData integration
[v] add/remove favorite
[] filtering by favorite
[] searching meditations
[v] playing the audio
[v] pausing the audio

### License

This project is licensed under the terms of the MIT license.
