import 'dart:io';
import 'package:early_eyes/components/coreComponents/ImageView.dart';
import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class MessageInputField extends StatefulWidget {
  final TextEditingController? controller;
  final VoidCallback? onSend;

  const MessageInputField({
    super.key,
    this.controller,
    this.onSend,
  });

  @override
  _MessageInputFieldState createState() => _MessageInputFieldState();
}

class _MessageInputFieldState extends State<MessageInputField> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  File? _selectedDocument;

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  Future<void> _pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'xlsx', 'pptx', 'txt'],
    );
    if (result != null) {
      setState(() {
        _selectedDocument = File(result.files.single.path!);
      });
    }
  }

  void _showAttachmentOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.7,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Wrap(
                    children: [
                      ListTile(
                        leading: const ImageView(url: AppImages.picture, size: 40),
                        title: TextView(
                          text: AppStrings.gallery,
                          margin: EdgeInsets.only(bottom: 15),
                          style: 15.txtMediumBlack,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          _pickImageFromGallery();
                        },
                      ),
                      ListTile(
                        leading: const ImageView(url: AppImages.document, size: 40),
                        title: TextView(
                          text: AppStrings.document,
                          margin: EdgeInsets.only(bottom: 15),
                          style: 15.txtMediumBlack,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          _pickDocument();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }


  Future<void> _pickImageFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 100,
                color: AppColors.messagecolor,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          controller: widget.controller,
                          decoration: InputDecoration(
                            hintText: 'Enter here...',
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8))),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: ImageView(
                                    url: AppImages.export,
                                    size: 30,
                                    onTap:  _showAttachmentOptions,
                                  ),

                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.camera_alt_outlined,
                                    color: AppColors.white,
                                  ),
                                  onPressed: _pickImageFromCamera,
                                ),
                              ],
                            ),
                          ),
                          style: TextStyle(color: AppColors.white),
                          onSubmitted: (_) => widget.onSend!(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: AppColors.white,
                      ),
                      onPressed: widget.onSend,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // if (_imageFile != null)
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: _buildCamera('Selected Image', _imageFile, _pickImageFromCamera),
        //   ),
        if (_selectedDocument != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Selected Document: ${_selectedDocument!.path.split('/').last}',
              style: TextStyle(color: AppColors.white),
            ),
          ),
      ],
    );
  }
}

// Widget _buildCamera(String label, XFile? image, VoidCallback onTap) {
//   return GestureDetector(
//     onTap: onTap,
//     child: Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColors.white),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       padding: EdgeInsets.symmetric(vertical: 30),
//       child: Column(
//         children: [
//           Text(label, style: TextStyle(fontSize: 16, color: AppColors.black)),
//           SizedBox(height: 10),
//           image != null
//               ? Image.file(File(image.path),
//               height: 100, width: double.infinity, fit: BoxFit.cover)
//               : const Icon(Icons.camera_alt_outlined, size: 60, color: AppColors.black),
//         ],
//       ),
//     ),
//   );
// }
