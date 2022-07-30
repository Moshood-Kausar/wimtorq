// ignore_for_file: file_names, library_private_types_in_public_api, depend_on_referenced_packages

import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class TapPage extends StatefulWidget {
  const TapPage({Key? key}) : super(key: key);

  @override
  _TapPageState createState() => _TapPageState();
}

class _TapPageState extends State<TapPage> {
  late ARKitController arkitController;
  ARKitSphere? sphere;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        
        appBar: AppBar(
          title: const Text('Square Gesture Sample'),
          backgroundColor: const Color(0xff1b663e),
        ),
        body: ARKitSceneView(
          enableRotationRecognizer: true,
          enableTapRecognizer: true,
          onARKitViewCreated: onARKitViewCreated,
        ),
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.onNodeTap = (nodes) => onNodeTapHandler(nodes);

    final material =
        ARKitMaterial(diffuse: ARKitMaterialProperty.color(Colors.yellow));
    sphere = ARKitSphere(
      materials: [material],
      radius: 0.1,
    );

    final node = ARKitNode(
      name: 'sphere',
      geometry: sphere,
      position: vector.Vector3(0, 0, -0.5),
    );
    this.arkitController.add(node);
  }

  void onNodeTapHandler(List<String> nodesList) {
    final color =
        (sphere!.materials.value!.first.diffuse as ARKitMaterialColor).color ==
                Colors.yellow
            ? Colors.blue
            : Colors.yellow;
    sphere!.materials.value = [
      ARKitMaterial(diffuse: ARKitMaterialProperty.color(color))
    ];
    showDialog<void>(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(content: Image.asset('assets/logo.png')),
    );
  }
}
