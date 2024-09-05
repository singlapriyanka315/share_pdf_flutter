# PDF Generation and Sharing in Flutter

A Flutter project designed to help developers implement seamless PDF generation and sharing capabilities, making document management within Flutter applications both efficient and intuitive.

## Getting Started

### Prerequisites
Before you begin, make sure your Flutter environment is properly set up. Follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install) if needed.

### Installation

In the command terminal, run the following commands to get started:

```sh
$ git clone https://github.com/singlapriyanka315/pdf-share-flutter.git
$ cd pdf-share-flutter
$ flutter run
```

### Simulate for iOS

#### Method One
- Open the project in Xcode from `ios/Runner.xcodeproj`.
- Hit the **play** button to run the app.

#### Method Two
Alternatively, you can run the following commands in your terminal to open the iOS Simulator and launch the app:

```sh
$ open -a Simulator
$ flutter run
```

### Simulate for Android

Ensure you have an Android emulator installed and running, then execute the following command:

```sh
$ flutter run
```

## Key Features

- **PDF Generation**: Create PDFs using the `pdf` package, with customizable text, images, and tables.
- **File Storage**: Save generated PDFs in the local storage using `path_provider`.
- **PDF Sharing**: Easily share the generated PDF files via other apps using `share_plus`.

## How to Use

This project includes the following core methods:

- `generatePdf()`: Generates a PDF document and saves it to the device’s local storage.
- `sharePdf()`: Shares the generated PDF via email, messaging apps, or other supported platforms.

## Dependencies

Ensure you have the following dependencies added to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  pdf: ^3.8.0
  path_provider: ^2.0.11
  share_plus: ^6.3.0
```
## Demo

<img width="328" alt="Screenshot 2024-09-05 at 11 58 36 AM" src="https://github.com/user-attachments/assets/5a2d3d93-a3a6-40c9-8c0a-855494c1ba08">

<img width="328" alt="Screenshot 2024-09-05 at 11 58 48 AM" src="https://github.com/user-attachments/assets/905a710c-2a25-4397-a155-1ba3a7871712">

<img width="328" alt="Screenshot 2024-09-05 at 11 58 48 AM" src="https://github.com/user-attachments/assets/27a01f38-cef4-443e-9154-5d6ff5cd6fc3">

<img width="328" alt="Screenshot 2024-09-05 at 11 59 07 AM" src="https://github.com/user-attachments/assets/b3a77af2-2527-499e-8adc-597538273ce2">

<img width="328" alt="Screenshot 2024-09-05 at 11 59 28 AM" src="https://github.com/user-attachments/assets/5d51a265-18c4-4668-ae1d-b29660032973">


Install the dependencies by running:

```sh
$ flutter pub get
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---
