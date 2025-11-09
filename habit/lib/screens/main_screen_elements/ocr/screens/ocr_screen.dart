import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/screens/main_screen_elements/notes/widgets/notes_widgets.dart';
import 'package:habit/screens/main_screen_elements/ocr/widgets/ocr_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class OcrScreen extends StatefulWidget {
  const OcrScreen({super.key});

  @override
  State<OcrScreen> createState() => _OcrScreenState();
}

class _OcrScreenState extends State<OcrScreen> {

  final ImagePicker picker = ImagePicker();
  XFile? imageGet;
  String scannedText = '';

  Future<void> openCamera() async {
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        imageGet = image;
      });
    }
  }

  Future<void> pickFromGallery() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageGet = image;
      });
    }
  }

  Future<void> scanImage() async {
    if (imageGet == null) return;

    final inputImage = InputImage.fromFilePath(imageGet!.path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final recognizedText = await textRecognizer.processImage(inputImage);
    await textRecognizer.close();

    setState(() {
      scannedText = recognizedText.text;
    });
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: 36),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Image to Text", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700)),
                IconButton(
                  onPressed: () {
                    if (scannedText.isNotEmpty) {
                      String textToCopy = scannedText.trim();
                      if (textToCopy.length > 2000) {
                        textToCopy = textToCopy.substring(0, 2000);
                      }

                      Clipboard.setData(ClipboardData(text: textToCopy));

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Container(
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            child: Text(
                              "Text copied",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black, fontSize: 18, height: 1),
                            )
                          ),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.1,
                            left: 120,
                            right: 120
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          duration: Duration(seconds: 2),
                        )
                      );
                    }
                  },
                  splashColor: Colors.transparent,
                  icon: Icon(Icons.copy, size: 24),
                )
              ],
            ),
            SizedBox(height: height * 0.047),
            OcrWidgets.buildContainer(
              height,
              imageGet == null
                  ? const Text('Upload an image\nusing the "+"\nbutton',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    )
                  : Image.file(File(imageGet!.path))
            ),
            SizedBox(height: 20),
            GestureDetector(
              onLongPress: () {
                setState(() {
                  scannedText = '';
                });
              },
              child: OcrWidgets.buildContainer(
                height,
                scannedText.isEmpty
                  ? const Text('Click the "Scan Image"\nbutton to perform scan',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    )
                  : Text(scannedText,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    )
              ),
            ),
            SizedBox(height: height * 0.047),
            Row(
              children: [
                OcrWidgets.buildButton(
                  'Clear Image',
                  AppColors.secondary, width,
                  () {
                    setState(() {
                      imageGet = null;
                    });
                  }),
                SizedBox(width: 14),
                OcrWidgets.buildButton(
                  'Scan Image',
                  AppColors.primary, width,
                  () async {
                    await scanImage();
                  },
                )
              ],
            )
          ],
        )
      ),
      floatingActionButton: NotesWidgets.buildAddButton(
        () {
          showDialog(context: context, builder: (BuildContext context) {
            return NotesWidgets.buildAddDialog(
              context, height,
              (){openCamera();},
              (){pickFromGallery();},
              'Take photo', 'Choose from gallery',
              Icons.camera_alt, Icons.photo_library);
          });
        }
      ),
    );
  }
}