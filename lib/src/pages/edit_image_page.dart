import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class EditCarPage extends StatelessWidget {
  final editorKey = GlobalKey<ExtendedImageEditorState>();
  ImageProvider provider;
  EditCarPage({
    Key key,
    this.provider,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Image'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop())
        ],
      ),
      body: buildImage(),
    );
  }

  Widget buildImage() {
    return ExtendedImage(
      image: provider,
      height: 400,
      width: 400,
      extendedImageEditorKey: editorKey,
      mode: ExtendedImageMode.editor,
      fit: BoxFit.contain,
      initEditorConfigHandler: (state) {
        return EditorConfig(
          maxScale: 8.0,
          cropRectPadding: EdgeInsets.all(20.0),
          hitTestSize: 20.0,
          cropAspectRatio: 2 / 1,
        );
      },
    );
  }
}
