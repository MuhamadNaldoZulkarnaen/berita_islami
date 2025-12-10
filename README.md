# Berita Islami

A Flutter app for browsing Islamic news headlines, featuring live data from the GNews API, search/filter functionality, and a clean, responsive UI.

## Project Explanation
Berita Islami is a cross-platform mobile app built with Flutter. It fetches and displays Islamic news headlines using the GNews API. The app demonstrates best practices in state management (Provider), asynchronous UI, and separation of concerns (service/repository pattern). Users can search/filter news, view details, and enjoy smooth navigation transitions.

## API Endpoints
- **GNews API**: https://gnews.io/api/v4/search?q=Islamic&token=YOUR_API_KEY
  - Replace `YOUR_API_KEY` with your actual GNews API key in `gnews_service.dart`.
- **Main Service File**: `lib/services/gnews_service.dart`

## Installation Instructions
1. **Clone the repository:**
   ```sh
   git clone <repo-url>
   cd berita_islami
   ```
2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
3. **Set up API key:**
   - Get a free API key from [GNews](https://gnews.io/).
   - Add your API key to `lib/services/gnews_service.dart`.
4. **Run the app:**
   ```sh
   flutter run
   ```
   - For Android/iOS: Connect your device or start an emulator/simulator.
   - For web: `flutter run -d chrome`

## Main Features
- Live Islamic news headlines (GNews API)
- Search and filter news
- Responsive UI with loading/error indicators
- Provider-based state management
- Custom navigation transitions and ripple feedback

## Folder Structure
- `lib/` - Main Dart code (UI, services, models, providers)
- `android/`, `ios/`, `web/`, `windows/`, `macos/`, `linux/` - Platform-specific code
- `test/` - Widget tests

## Dependencies
- provider
- http
- cached_network_image
- flutter_svg
- shared_preferences
- connectivity_plus
- url_launcher

## License
See LICENSE file for details.
