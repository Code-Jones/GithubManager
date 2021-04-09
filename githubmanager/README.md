# Github Manager

This is a Github Manager for Windows Desktop made with Flutter 2.
Do we actually need one.. not really but I thought it was a cool project.

## To Just Use The Application (Windows Only Currently)

1. Go to the following link and download the zip file.
https://drive.google.com/file/d/1woBIvmGJOTZy0upa4oYfw9nrIbgWINgQ/view?usp=sharing
2. Export and run githubmanager.exe.
3. Leave the executable with in the file with the .dll files.

## To Start Your Own

1. Clone or fork the project
2. Go to pubspec.yaml and run pub get to get dependencies
3. Set up your own Oauth app with github, instructions here:
https://docs.github.com/en/developers/apps/creating-an-oauth-app
4. Go to lib/github_oauth_credentials_hidden.dart and add your id's and change the file name to lib/github_oauth_credentials.dart
5. Depending if you want to update the existing graphql configuration, you may want to do the same as step 4 with lib/graphql/.graphqlconfig_hidden
6. Pick what you want to do

This project is set up for Windows and MacOS but could be changed to run on Mobile(Android/iOS) or made into a Website

First make sure you check if you have Flutter set up properly. If you do please skip this step and go down to choose your platform

## Flutter Set Up

If you have never used Flutter before:
For Windows and Mac the youtube video goes through the set up well and will explain everything you need to do.
For Linux and Web the best is to look through the Flutter get started docs
Windows = https://www.youtube.com/watch?v=T9LdScRVhv8
MacOS = https://www.youtube.com/watch?v=9GuzMsZQUYs
Linux = https://flutter.dev/docs/get-started/install/linux
Web = https://flutter.dev/docs/get-started/install/chromeos
Here are also some resources you'll find helpful.

Online documentation : https://flutter.dev/docs
Write your first Flutter app : https://flutter.dev/docs/get-started/codelab
Useful Flutter samples : https://flutter.dev/docs/cookbook

If you have Flutter already installed but haven't updated to Flutter 2.
This will run you through the update but for the quick version just run the commands below.
https://flutter.dev/docs/development/tools/sdk/upgrading

> flutter upgrade
> flutter channel stable
> flutter upgrade
> flutter config --enable-{platform}-desktop / --enable-windows-desktop / --enable-macos-desktop / --enable-linux-desktop
> flutter devices (should see your platform)
> flutter run / or > flutter run -d {platform} / windows / macos/ linux

## Windows
This is the easiest option. Everything is set up for you.
1. Run & play

## MacOS
This project 'should' work as is. I haven't tested this though.
1. Run & play

## Web & Mobile
This project is set up currently for desktop application but if can be configured easily for web or mobile.
The main change will be in the login authentication process.
Currently the application runs a temporary web server to run the authorization but this could be changed to send an OAuth2 Post request instead.
The UI should all work the same and the data loading should work the same.
I would refer to this doc: https://docs.github.com/en/developers/apps/authorizing-oauth-apps






