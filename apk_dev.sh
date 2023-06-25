#flutter clean && flutter pub get
#flutter build apk --split-per-abi --target-platform android-arm64 --bundle-sksl-path ./gen/flutter_01.sksl.json --dart-define-from-file=./env/dev.json --dart-define=use_proxy=true
flutter build apk --split-per-abi --target-platform android-arm64 --dart-define-from-file=./env/dev.json --dart-define=use_proxy=true