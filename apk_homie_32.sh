#flutter clean && flutter pub get
#flutter build apk --target-platform android-arm --bundle-sksl-path ./gen/flutter_01.sksl.json --obfuscate --split-debug-info=./gen/symbolize --dart-define-from-file=./env/release.json --android-project-arg armv7

array=(1000)
# 逐个打印数组中的元素
for element in "${array[@]}"
do
  flutter build apk --target-platform android-arm --obfuscate --split-debug-info=./gen/symbolize --dart-define-from-file=./env/release_homie.json --android-project-arg armv7 --dart-define=channelCode=$element
done