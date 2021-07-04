import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';

import '../providers/imageProvider.dart';
import '../themes/customColorThemes.dart';

class ImageDisplay extends StatelessWidget {
  ImageDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) => Container(
        height: constraints.maxHeight,
        child: DottedBorder(
          color: CustomColorThemes.primaryColorCustom,
          dashPattern: [20, 20],
          child: Container(
            child: Provider.of<ImageCarrier>(context).imageDataInitialized
                ? Image.memory(
                    Provider.of<ImageCarrier>(context).imageData,
                    fit: BoxFit.fill,
                    height: constraints.maxHeight * 0.8,
                    width: constraints.maxWidth * 0.8,
                  )
                : Center(
                    child: Text(
                      "No image uploaded",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: CustomColorThemes.primaryColorCustom,
                          ),
                    ),
                  ),
          ),
        ),
        padding: EdgeInsets.all(constraints.maxHeight * 0.1),
        constraints: BoxConstraints(
          minWidth: constraints.maxWidth,
        ),
        color: CustomColorThemes.secondaryColorCustom.shade800,
      ),
    );
  }
}
