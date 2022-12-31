import 'package:aryarb/views/homeView.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme:
              GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.black),
              titleTextStyle:
                  GoogleFonts.nunito(color: Colors.black, fontSize: 20))),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   ARSessionManager? arSessionManager;
//   ARObjectManager? arObjectManager;
//   ARAnchorManager? arAnchorManager;

//   List<ARNode> nodes = [];
//   List<ARAnchor> anchors = [];

//   @override
//   void dispose() {
//     super.dispose();
//     arSessionManager!.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('AR yaarb'),
//         ),
//         body: Container(
//             child: Stack(children: [
//           ARView(
//             onARViewCreated: onARViewCreated,
//             planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
//           ),
//           Align(
//             alignment: FractionalOffset.bottomCenter,
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                       onPressed: onRemoveEverything,
//                       child: Text("Remove Everything")),
//                 ]),
//           )
//         ])));
//   }

//   void onARViewCreated(
//       ARSessionManager arSessionManager,
//       ARObjectManager arObjectManager,
//       ARAnchorManager arAnchorManager,
//       ARLocationManager arLocationManager) {
//     this.arSessionManager = arSessionManager;
//     this.arObjectManager = arObjectManager;
//     this.arAnchorManager = arAnchorManager;

//     this.arSessionManager!.onInitialize(
//           showFeaturePoints: false,
//           showPlanes: true,
//           customPlaneTexturePath: "Images/triangle.png",
//           showWorldOrigin: true,
//           handlePans: true,
//           handleRotation: true,
//         );
//     this.arObjectManager!.onInitialize();

//     this.arSessionManager!.onPlaneOrPointTap = onPlaneOrPointTapped;
//     this.arObjectManager!.onPanStart = onPanStarted;
//     this.arObjectManager!.onPanChange = onPanChanged;
//     this.arObjectManager!.onPanEnd = onPanEnded;
//     this.arObjectManager!.onRotationStart = onRotationStarted;
//     this.arObjectManager!.onRotationChange = onRotationChanged;
//     this.arObjectManager!.onRotationEnd = onRotationEnded;
//   }

//   Future<void> onRemoveEverything() async {
//     /*nodes.forEach((node) {
//       this.arObjectManager.removeNode(node);
//     });*/
//     anchors.forEach((anchor) {
//       this.arAnchorManager!.removeAnchor(anchor);
//     });
//     anchors = [];
//   }

//   Future<void> onPlaneOrPointTapped(
//       List<ARHitTestResult> hitTestResults) async {
//     var singleHitTestResult = hitTestResults.firstWhere(
//         (hitTestResult) => hitTestResult.type == ARHitTestResultType.plane);
//     if (singleHitTestResult != null) {
//       var newAnchor =
//           ARPlaneAnchor(transformation: singleHitTestResult.worldTransform);
//       bool? didAddAnchor = await this.arAnchorManager!.addAnchor(newAnchor);
//       if (didAddAnchor!) {
//         this.anchors.add(newAnchor);
//         // Add note to anchor
//         var newNode = ARNode(
//             type: NodeType.webGLB,
//             uri:
//                 "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF-Binary/Duck.glb",
//             scale: Vector3(0.2, 0.2, 0.2),
//             position: Vector3(0.0, 0.0, 0.0),
//             rotation: Vector4(1.0, 0.0, 0.0, 0.0));
//         bool? didAddNodeToAnchor = await this
//             .arObjectManager!
//             .addNode(newNode, planeAnchor: newAnchor);
//         if (didAddNodeToAnchor!) {
//           this.nodes.add(newNode);
//         } else {
//           this.arSessionManager!.onError("Adding Node to Anchor failed");
//         }
//       } else {
//         this.arSessionManager!.onError("Adding Anchor failed");
//       }
//     }
//   }

//   onPanStarted(String nodeName) {
//     print("Started panning node " + nodeName);
//   }

//   onPanChanged(String nodeName) {
//     print("Continued panning node " + nodeName);
//   }

//   onPanEnded(String nodeName, Matrix4 newTransform) {
//     print("Ended panning node " + nodeName);
//     final pannedNode =
//         this.nodes.firstWhere((element) => element.name == nodeName);
//     /*
//     * Uncomment the following command if you want to keep the transformations of the Flutter representations of the nodes up to date
//     * (e.g. if you intend to share the nodes through the cloud)
//     */
//     //pannedNode.transform = newTransform;
//   }

//   onRotationStarted(String nodeName) {
//     print("Started rotating node " + nodeName);
//   }

//   onRotationChanged(String nodeName) {
//     print("Continued rotating node " + nodeName);
//   }

//   onRotationEnded(String nodeName, Matrix4 newTransform) {
//     print("Ended rotating node " + nodeName);
//     final rotatedNode =
//         this.nodes.firstWhere((element) => element.name == nodeName);

//     /*
//     * Uncomment the following command if you want to keep the transformations of the Flutter representations of the nodes up to date
//     * (e.g. if you intend to share the nodes through the cloud)
//     */
//     //rotatedNode.transform = newTransform;
//   }
// }
