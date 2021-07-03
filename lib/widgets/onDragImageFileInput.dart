import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';

import '../providers/imageProvider.dart';
import '../themes/customColorThemes.dart';

class OnDragImageFileInput extends StatefulWidget {
  const OnDragImageFileInput({Key? key}) : super(key: key);

  @override
  _OnDragImageFileInputState createState() => _OnDragImageFileInputState();
}

class _OnDragImageFileInputState extends State<OnDragImageFileInput> {
  late DropzoneViewController controller;
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: constraints.maxWidth * 1 / 26,
          vertical: constraints.maxHeight * 1 / 26,
        ),
        child: Row(
          children: [
            /* TODO: Take this image displayer out of this widget so that it
               doesn't get rebuilt at every hover action.
            */
            Flexible(
              child: Container(
                height: constraints.maxHeight,
                child: DottedBorder(
                  color: CustomColorThemes.primaryColorCustom,
                  dashPattern: [20, 20],
                  child: Provider.of<ImageCarrier>(context).imageDataInitialized
                      ? Image.memory(
                          Provider.of<ImageCarrier>(context).imageData,
                          fit: BoxFit.fill,
                        )
                      : Center(
                          child: Text(
                            "No image uploaded",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                  color: CustomColorThemes.primaryColorCustom,
                                ),
                          ),
                        ),
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
              child: Stack(
                children: [
                  DropzoneView(
                    onCreated: (controller) => this.controller = controller,
                    onHover: () {
                      if (!this._hovered) {
                        setState(() {
                          this._hovered = true;
                        });
                      }
                    },
                    onLeave: () {
                      if (this._hovered) {
                        setState(() {
                          this._hovered = false;
                        });
                      }
                    },
                    onDrop: _acceptFile,
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    height: constraints.maxHeight,
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth * 8 / 13,
                    ),
                    padding: EdgeInsets.all(25),
                    color: this._hovered
                        ? CustomColorThemes.logoPinkColorCustom.withOpacity(0.9)
                        : CustomColorThemes.logoPinkColorCustom
                            .withOpacity(0.45),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: AnimatedContainer(
                            alignment: this._hovered
                                ? Alignment.topCenter
                                : Alignment.bottomCenter,
                            duration: Duration(milliseconds: 250),
                            child: Icon(
                              Icons.cloud_upload,
                              size: 80,
                              color: CustomColorThemes.secondaryColorCustom,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: AnimatedContainer(
                            padding: EdgeInsets.only(top: 15),
                            alignment: this._hovered
                                ? Alignment.bottomCenter
                                : Alignment.topCenter,
                            duration: Duration(milliseconds: 250),
                            child: Text(
                              "Drag your image to upload",
                              style: TextStyle(
                                  fontFamily: "Raleway",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _acceptFile(dynamic event) async {
    final mime = await this.controller.getFileMIME(event);
    final bytes = await this.controller.getFileSize(event);

    if (mime.split('/')[0] == "image" && bytes / (1024 * 1024) <= 3) {
      final data = await this.controller.getFileData(event);
      Provider.of<ImageCarrier>(context, listen: false).loadImage(data);
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Please upload an image file!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Raleway",
              fontSize: 16,
              color: CustomColorThemes.primaryColorCustom,
            ),
          ),
          backgroundColor: CustomColorThemes.secondaryColorCustom,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
    setState(() {
      this._hovered = false;
    });
  }
}
