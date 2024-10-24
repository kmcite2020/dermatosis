import 'package:dermatosis/imageries/imageries.dart';
import 'package:dermatosis/main.dart';

import 'imageries_bloc.dart';

class ImageriesPage extends UI {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => back(),
          child: 'IMAGERIES'.text().pad(),
        ),
        actions: [
          LeadingBackButton(),
        ],
        leading: FloatingActionButton(
          onPressed: pickImageToSaveImagery,
          child: Icon(Icons.add_a_photo),
        ).pad(),
      ),
      body: switch (loadingImageries) {
        false => ListView.builder(
            itemCount: imageries().length,
            itemBuilder: (context, index) {
              final picture = imageries().elementAt(index);
              return Stack(
                children: [
                  Container(
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.memory(
                        picture.image!,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: settingsRM.materialColor(),
                      ),
                    ),
                  ),
                  Positioned(
                    child: IconButton.filled(
                      onPressed: () {
                        removeImagery(picture.id);
                      },
                      icon: Icon(Icons.delete),
                    ),
                    right: 8,
                    bottom: 8,
                  ),
                ],
              ).pad();
            },
          ),
        true => CircularProgressIndicator()
      },
    );
  }
}

// class PicturesPage extends UI {
//   static const name = '/pictures';

//   const PicturesPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(settingsRM.padding()),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(settingsRM.borderRadius()),
//         child: switch (settingsRM.picturesViewMode()) {
//           PicturesViewMode.fullscreen => buildFullscreenView(),
//           PicturesViewMode.listviewWithDate => buildListView(),
//           PicturesViewMode.gridview => buildGridview(),
//         },
//       ),
//     );
//   }

//   PicturesViewMode nextMode(PicturesViewMode currentMode) {
//     return switch (currentMode) {
//       PicturesViewMode.fullscreen => PicturesViewMode.listviewWithDate,
//       PicturesViewMode.listviewWithDate => PicturesViewMode.gridview,
//       PicturesViewMode.gridview => PicturesViewMode.fullscreen,
//     };
//   }

//   IconData nextModeIcon(PicturesViewMode currentMode) {
//     return switch (currentMode) {
//       PicturesViewMode.fullscreen => Icons.fullscreen,
//       PicturesViewMode.listviewWithDate => Icons.list,
//       PicturesViewMode.gridview => Icons.grid_3x3,
//     };
//   }

//   Widget buildGridview() {
//     const paddingSize = 8.0;
//     return SafeArea(
//       child: Scaffold(
//         body: GridView.count(
//           padding: const EdgeInsets.all(paddingSize),
//           mainAxisSpacing: paddingSize,
//           crossAxisSpacing: paddingSize,
//           crossAxisCount: 2,
//           children: imageriesRM.images
//               .map(
//                 (e) => ClipRRect(
//                   borderRadius: BorderRadius.circular(settingsRM.borderRadius()),
//                   child: Image.memory(
//                     e.image!,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               )
//               .toList(),
//         ),
//         floatingActionButton: addButton,
//       ),
//     );
//   }

//   Widget buildFullscreenView() {
//     final size = MediaQuery.of(RM.context!).size;
//     return SafeArea(
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(settingsRM.borderRadius()),
//         child: DefaultTabController(
//           length: imageriesRM.imageries.length,
//           child: Scaffold(
//             body: TabBarView(
//               children: imageriesRM.images
//                   .map(
//                     (eachPictureModel) => Stack(
//                       children: [
//                         GestureDetector(
//                           onDoubleTap: () {
//                             // router.back(e);
//                           },
//                           child: Image.memory(
//                             eachPictureModel.image!,
//                             fit: BoxFit.fill,
//                             width: size.width,
//                             height: size.height,
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.topCenter,
//                           child: topCenterFullScreenCounter(
//                             imageriesRM.images.indexOf(eachPictureModel),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                   .toList(),
//             ),
//             floatingActionButton: addButton,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildListView() {
//     return Scaffold(
//       body: ListView(
//         children: imageriesRM.images
//             .map(
//               (e) => ClipRRect(
//                 borderRadius: BorderRadius.circular(settingsRM.borderRadius()),
//                 child: Image.memory(e.image!),
//               ).pad(),
//             )
//             .toList(),
//       ),
//       floatingActionButton: addButton,
//     );
//   }

//   IconButton topCenterFullScreenCounter(int index) {
//     return IconButton.filledTonal(
//       onPressed: null,
//       icon: '${index + 1}/${imageriesRM.images.length}'.text(),
//     );
//   }

//   Widget nextModeButton() {
//     return FloatingActionButton(
//       heroTag: randomID,
//       onPressed: () => settingsRM.picturesViewMode(
//         nextMode(settingsRM.picturesViewMode()),
//       ),
//       child: Icon(nextModeIcon(settingsRM.picturesViewMode())),
//     );
//   }

//   Widget get addButton {
//     return OverflowBar(
//       children: [
//         FloatingActionButton(
//           heroTag: randomID,
//           onPressed: () {
//             navigator.back();
//           },
//           child: const Icon(Icons.arrow_back),
//         ),
//         FloatingActionButton(
//           heroTag: randomID,
//           onPressed: imageriesRM.pickPicture,
//           child: const Icon(Icons.add_a_photo),
//         ),
//         nextModeButton()
//       ],
//     );
//   }
// }
