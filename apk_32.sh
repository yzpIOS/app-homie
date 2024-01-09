#flutter clean && flutter pub get
#flutter build apk --target-platform android-arm --bundle-sksl-path ./gen/flutter_01.sksl.json --obfuscate --split-debug-info=./gen/symbolize --dart-define-from-file=./env/release.json --android-project-arg armv7
#flutter build apk --target-platform android-arm --obfuscate --split-debug-info=./gen/symbolize --dart-define-from-file=./env/release.json --android-project-arg armv7

flutter build apk --target-platform android-arm --bundle-sksl-path ./gen/flutter_01.sksl.json --obfuscate --split-debug-info=./gen/symbolize --dart-define-from-file=./env/release.json --android-project-arg armv7