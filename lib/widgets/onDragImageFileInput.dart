import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:dotted_border/dotted_border.dart';

import '../themes/customColorThemes.dart';

class OnDragImageFileInput extends StatefulWidget {
  const OnDragImageFileInput({Key? key}) : super(key: key);

  @override
  _OnDragImageFileInputState createState() => _OnDragImageFileInputState();
}

class _OnDragImageFileInputState extends State<OnDragImageFileInput> {
  late DropzoneViewController controller;
  List<String> _temporaryUrls = [];

  // TODO: Remove this from dispose so when user views about page, url is not lost.
  @override
  void dispose() {
    this._temporaryUrls.forEach((url) {
      this.controller.releaseFileUrl(url);
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) => Stack(
        children: [
          DropzoneView(
            onCreated: (controller) => this.controller = controller,
            onDrop: _acceptFile,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth * 1 / 26,
              vertical: constraints.maxHeight * 1 / 26,
            ),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    child: DottedBorder(
                      color: CustomColorThemes.primaryColorCustom,
                      dashPattern: [20, 20],
                      child: Container(),
                    ),
                    padding: EdgeInsets.all(50),
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth * 5 / 13,
                    ),
                    color: CustomColorThemes.secondaryColorCustom.shade800,
                  ),
                  flex: 5,
                ),
                Flexible(
                  flex: 8,
                  child: Container(
                    height: constraints.maxHeight,
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth * 8 / 13,
                    ),
                    color:
                        CustomColorThemes.logoPinkColorCustom.withOpacity(0.3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_upload,
                          size: 80,
                          color: CustomColorThemes.secondaryColorCustom,
                        ),
                        Text(
                          "Drag your image to upload",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _acceptFile(dynamic event) async {
    print(event.name);

    //TODO: Change this to get the data instead of url, and hold it in a database!
    final url = await this.controller.createFileUrl(event);
    this._temporaryUrls.add(url);

    final mime = await this.controller.getFileMIME(event);
    final bytes = await this.controller.getFileSize(event);
  }
}
