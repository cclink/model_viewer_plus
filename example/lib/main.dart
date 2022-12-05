/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(MyApp());
String relatedCss = '''
  model-viewer::part(default-progress-bar){
    display: none;
  }
''';

String relatedJs = '''
  const onVisible = (event) => {
    if (event.detail.visible === true) {
      sendMessageToFlutter('');
    }
  };

  document.querySelector('model-viewer').addEventListener('model-visibility', onVisible);
''';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Model Viewer")),
        body: ModelViewer(
          backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
          src: 'https://res.app.ikea.cn/sales-item/3d-models/19270271/19270271.glb',
          alt: "A 3D model of an astronaut",
          ar: false,
          arModes: ['scene-viewer', 'webxr', 'quick-look'],
          autoRotate: true,
          cameraControls: true,
          relatedJs: relatedJs,
          relatedCss: relatedCss,
          onLoaded: (){
            print('load success');
          }
        ),
      ),
    );
  }
}
