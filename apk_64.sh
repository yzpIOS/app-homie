#flutter clean && flutter pub get
#flutter build apk --split-per-abi --target-platform android-arm64 --bundle-sksl-path ./gen/flutter_01.sksl.json --obfuscate --split-debug-info=./gen/symbolize --dart-define-from-file=./env/release.json
#flutter build apk --split-per-abi --target-platform android-arm64 --obfuscate --split-debug-info=./gen/symbolize --dart-define-from-file=./env/release.json

array=(1000)
# 逐个打印数组中的元素
for element in "${array[@]}"
do
  flutter build apk --split-per-abi --target-platform android-arm64 --obfuscate --split-debug-info=./gen/symbolize --dart-define-from-file=./env/release.json --dart-define=channelCode=$element
done