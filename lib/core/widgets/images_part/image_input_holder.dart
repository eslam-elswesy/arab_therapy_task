import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageInput extends StatefulWidget {
  Function(File)? saveImage;
  File? imageFile;
  Widget? child;
  bool? pickPDF;

  ImageInput({super.key, this.saveImage, this.imageFile, this.child, this.pickPDF = false});

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Widget imagePlace = GestureDetector(
        onTap: () async{
          var status = await Permission.storage.status;
          if(status.isGranted){
            (widget.pickPDF ?? false) ? _pdf(context) : _showChooses(context);
          }else {
            await Permission.storage.request();
            (widget.pickPDF ?? false) ? _pdf(context) : _showChooses(context);
          }
        }, child: widget.child);
    return imagePlace;
  }

  _showChooses(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
            bottom: true,
            child: Container(
              padding: const EdgeInsets.all(10.5),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () => _getImage(ImageSource.camera), //_getImage(context,ImageSource.camera),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.camera,
                          color: Colors.amber,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text('Camera'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  OutlinedButton(
                    onPressed: () => _getImage(ImageSource.gallery),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.image,
                          color: Colors.deepPurple,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text('Gallery'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  _getImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      widget.imageFile = File(pickedFile!.path);
      widget.saveImage!(File(pickedFile.path));
    });
    Navigator.pop(context);
  }

  _pdf(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      widget.imageFile = file;
      widget.saveImage!(file);
    } else {
      // User canceled the picker
    }
  }
}
