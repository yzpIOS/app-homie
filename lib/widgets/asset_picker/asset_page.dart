// import 'package:app/common/theme.dart';
// import 'package:app/tools.dart';
// import 'package:app/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:photo_manager/photo_manager.dart';
//
// class AssetPicker {
//   AssetPicker._();
//
//   static Future<List<AssetEntity>?> show({
//     int? max,
//     List<AssetEntity>? selected,
//     RequestType type = RequestType.common,
//   }) async {
//     final selectRx = RxList<AssetEntity>(selected ?? []);
//
//     final child = AssetPage._(max: max, selectRx: selectRx, type: type);
//
//     final sheet = ConstrainedBox(
//       constraints: BoxConstraints(maxHeight: Get.height * 0.8),
//       child: child,
//     );
//
//     return Get.bottomSheet(
//       sheet,
//       settings: child.toRouteSettings(),
//       enableDrag: true,
//       isDismissible: true,
//       ignoreSafeArea: true,
//       isScrollControlled: true,
//       backgroundColor: null,
//       clipBehavior: Clip.hardEdge,
//       shape: AppShape.a10,
//     );
//   }
// }
//
// class AssetPage extends StatefulWidget {
//   final int? max;
//   final RequestType type;
//   final RxList<AssetEntity> selectRx;
//
//   const AssetPage._({Key? key, required this.selectRx, required this.type, this.max}) : super(key: key);
//
//   @override
//   State<AssetPage> createState() => _AssetPageState();
// }
//
// class _AssetPageState extends State<AssetPage> {
//   late final dataRx = RxList<AssetPathEntity>();
//   late final selectRx = widget.selectRx;
//
//   @override
//   void initState() {
//     super.initState();
//
//     PhotoManager.getAssetPathList(hasAll: true, onlyAll: false, type: widget.type) //
//         .then(dataRx.assignAll);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: xAppBar(
//         leading: const CloseButton(),
//         actions: [
//           Obx(
//             () => IconButton(
//               icon: const Icon(Icons.done),
//               onPressed: selectRx.isEmpty ? null : () => Get.back(result: selectRx()),
//             ),
//           ),
//         ],
//         title: Builder(
//           builder: (context) {
//             final max = widget.max;
//
//             return max == null //
//                 ? const XText('请选择')
//                 : Obx(() => XText('已选择(${selectRx.length}/$max)'));
//           },
//         ),
//       ),
//       body: $DataView(),
//     );
//   }
//
//   Widget $DataView() {
//     final child = Obx(
//       () {
//         final data = dataRx();
//
//         if (data.isEmpty) return Spacing.blank;
//
//         return DefaultTabController(
//           length: data.length,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TabBar(
//                 isScrollable: true,
//                 tabs: data.map((it) => Tab(text: it.name)).toList(growable: false),
//               ),
//               Expanded(
//                 child: TabBarView(
//                   children: data
//                       .map((it) => _DataView(entity: it, isSelected: _isSelected, onSelect: _onSelect))
//                       .toList(growable: false),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//
//     const config = GridConfig(
//       padding: Pad(all: 10),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         mainAxisSpacing: 5,
//         crossAxisSpacing: 5,
//       ),
//     );
//
//     return ConfigList(config: config, child: child);
//   }
//
//   bool _isSelected(AssetEntity asset) => selectRx.contains(asset);
//
//   void _onSelect(AssetEntity asset) {
//     if (_isSelected(asset)) {
//       selectRx.remove(asset);
//     } else {
//       final max = widget.max;
//
//       if (max == 1) {
//         selectRx.assign(asset);
//       } else if (max == null || selectRx.length < max) {
//         selectRx.add(asset);
//       } else {
//         showToast('最多可选 $max 个');
//       }
//     }
//   }
// }
//
// class _DataView extends SimplePageView<AssetEntity> {
//   final AssetPathEntity entity;
//
//   final void Function(AssetEntity) onSelect;
//   final bool Function(AssetEntity) isSelected;
//
//   _DataView({required this.entity, required this.isSelected, required this.onSelect});
//
//   @override
//   Future fetchPage(PageNum page) => entity.getAssetListPaged(page: page.index, size: page.size);
//
//   @override
//   Widget itemBuilder(BuildContext context, AssetEntity item, int index) {
//     final image = ClipRRect(
//       borderRadius: AppBorderRadius.a4,
//       child: Image(
//         image: AssetEntityImageProvider(item, isOriginal: false),
//         fit: BoxFit.cover,
//       ),
//     );
//
//     return Obx(
//       () {
//         return OpacityButton(
//           onTap: () => onSelect(item),
//           child: $SelectView(
//             isSelected: isSelected(item),
//             child: image,
//           ),
//         );
//       },
//     );
//   }
//
//   Widget $SelectView({required bool isSelected, required Widget child}) {
//     return Stack(
//       children: [
//         Positioned.fill(
//           child: AnimatedPadding(
//             duration: kRadialReactionDuration,
//             padding: isSelected ? const Pad(all: 2) : Pad.zero,
//             child: child,
//           ),
//         ),
//         Positioned(
//           top: 4,
//           right: 4,
//           child: IgnorePointer(child: XRadio(value: isSelected)),
//         ),
//       ],
//     );
//   }
// }
