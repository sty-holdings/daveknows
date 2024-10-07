# xCode Configuration:

[Home](https://github.com/sty-holdings/savup/blob/main/README.md)

1. Open xCode.
1. Click on **Open Existing Project** or select the project listed on the right side of the panel.
   - When using **Open Existing Project**, go to the ios folder within the project file and click **Open**.
1. Click on the folder on the left navigation panel.
1. In the center panel, you will see **General**, **Signing & Capabilities**, etc. These panel settings are covered below.
1. After updating the settings, open **Terminal** and run **flutter build ios**.
You will get a message that the build failed or something like the following:
- Built /Users/syacko/workspace/styh-dev/src/savup/build/ios/iphoneos/Runner.app.
1. Next, we need to set the AppIcon to the project icon. Go to this YouTube [video](https://www.youtube.com/watch?v=fpCb1ArYSvg).
1. Finally, set the LaunchImage and background color. Go to this YouTube [video](https://www.youtube.com/watch?v=UbkH-tcd8GY).

***Section Links:*** [Signing & Capabilities](#signing--capabilities), [Resource Tags](#Resource-Tags), [Info](#info), [Build Setings](#build-settings-build-phases-and-build-rules), [Build Phases](#build-settings-build-phases-and-build-rules), [Build Rules](#build-settings-build-phases-and-build-rules)


## General
### Supported Destinations
Add or remove the platforms the project will support using the '+' and '-' at the bottom of the section.
- Normally, you should have **iPhone**, and others are optional.
### Minimum Deployments
From the dropdown, select the iOS version. Disregard the '+' button, we don't use it.
- This should be 12.0 or higher.
### Identity
#### App Category
Select the category that matches the closest to the project's functionality using the dropdown selector.
- **SavUp** should be set to **Finance**
#### Display Name
The name the customers will see after installing the project.
- **SavUp** should be **SavUp**
#### Bundle Identifer
This should follow the following format: com.styholdings.{project name}
- **SavUp** should be **com.styholdings.savup**
#### Version
This is pulled from the **pubspec.yaml** file.
#### Build
This is pulled from the **pubspec.yaml** file.
### Deployment Info
#### iPhone Orientation & iPad Orientation
Set what makes sense for the project.
- **SavUp** should have **Portrait**, **Landscape Left**, and **Landscape Right** selected.
#### Status Bar Style
Set what makes sense for the project.
- **SavUp** uses the default values. No changes.
### App Icons and Launch Screen
#### App icon
Set what makes sense for the project.
- **SavUp** uses the default values. No changes.
### Supported Intents
Use the default. No change.
### Frameworks, Libraries, and Embedded Content
Use the default. No change.
### Development Assets
Use the default. No change.

## Signing & Capabilities
### Signing
**Automatically manage signing** should be selected.
#### Team
This must be set to **STY-Holdings, Inc.**.
#### Bundle Identifier
This must be set using the following format: **com.styholdings.{project name}**.
- **SavUp** is **com.sthholdings.savup**.
### iOS
#### Provisioning Project
This should be the default value of **Xcode Managed Profile**
#### Signing Certificate
This is set when the **Team** is selected, so there is no change.

## Resource Tags
Nothing is set here.

## Info
### Customer iOS Target Properties
#### Bundle name
The **type** should be a **String**, and the **value** should be the **project name**.
- **SavUp** should be set to **savup**.
#### Bundle Identifier
The type should be a **String**, and the value should be **$(PRODUCT_BUNDLE_IDENTIFIER)**
#### InfoDistionary version
Use the default. No change.
#### Main storyboard file base name
This should always be set to **Main**.
#### CADisableMinimunFrameDurationOnPhone
The **type** should be a **Boolean**, and the **value** should be the **YES**.
#### Launch screen interface file base name
The **type** should be a **String**, and the **value** should be the **LaunchScreen**.
#### Executable file
The type should be a **String**, and the value should be **$(EXECUTABLE_NAME)**
#### Application requires iPhone environment
The **type** should be a **Boolean**, and the **value** should be the **YES**.
#### Bundle version
The type should be a **String**, and the value should be **$(FLUTTER_BUILD_NUMBER)**
#### Supported interface orientations
This is set in the **General > iPhone Orientation & iPad Orientation** setting. No change here.
#### Bundle display name
The **type** should be a **String**, and the **value** should be the **project name**.
- **SavUp** should be set to **SavUp**.
#### Bundle version string (short)
The type should be a **String**, and the value should be **$(FLUTTER_BUILD_NAME)**
#### Bundle OS Type code
The **type** should be a **String**, and the **value** should be the **APPL**.
#### Bundle creator OS Type code
I don't know what this is used for, so I leave it set to **????**.
#### Default localization
The type should be a **String**, and the value should be **$(DEVELOPMENT_LANGUAGE)**
#### Application supports indirect input events
The **type** should be a **Boolean**, and the **value** should be the **YES**.
### Document Types, Export Type Identifiers, Imported Type Identifiers, and URL Types
I don't know what this is used for, so no change.

## Build Settings, Build Phases, and Build Rules
Anything that needs to change in the section is set from another section, so no changes are needed.
