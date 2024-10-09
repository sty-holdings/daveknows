# Release Processes:

[Home](https://github.com/sty-holdings/savup/blob/main/README.md)

## First Steps
1. Open the IDE and open the pubspec.yaml file
2. Update the version using the following format:
   - First node:  Year
   - Second node: Build
   - Third node:  zero unless this is a bug fix
   - The Plus: must be incremented by one for every release
   - Examples
       - 2023.17.0 new release with a plus of 1
       - 2023.17.1 bug fix for release 2023.17 with a plus of 2
3. Run Flutter `pub get` and then `pub upgrade`
4. Check main.dart code
```
   class MyApp extends BaseAppState {
  MyApp() : super(SavUpSharedModel(navigator: SavUpNavigator(), theme: Constants.customTheme));

  Future<void> downloadAssetsAndData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      const env = String.fromEnvironment('env', defaultValue: 'local');
```
5. Replace the `defaultValue` value with prod so it looks like this: `const env = String.fromEnvironment('env', defaultValue: 'prod');`
6. Select Build > Flutter > Build iOS
7. Select Build > Flutter > Build App Bundle

If all these steps are completed without errors, then move on to the platform-specific instructions below.


## Support Platforms

[Apple](https://github.com/sty-holdings/savup/blob/main/readme/AppleRelease.md)

[Android](https://github.com/sty-holdings/savup/blob/main/readme/AndroidRelease.md)
