import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:follow_up/Function/decoration.dart';
import 'package:follow_up/Widgets/ElevatedButton.dart';
import 'package:image_picker/image_picker.dart';

class Documents extends StatefulWidget {
  @override
  State<Documents> createState() => _DocumentState();
}

class _DocumentState extends State<Documents> {
  TextEditingController documentscontrollers = TextEditingController();
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Key for the form

  List<File> uploadedFiles = [];
  late File _imageFile;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        uploadedFiles.add(File(result.files.single.path!));
      });
    } else {
      print('User canceled the file picking.');
    }
  }

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  void _uploadFile(File file) async {
    // Implement your file upload logic here
    print('Uploading file: ${file.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // Assign the form key
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.red, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _pickFile,
                      icon: Icon(
                        Icons.file_present_outlined,
                        size: 60,
                        color: Colors.red,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        for (var file in uploadedFiles) {
                          _uploadFile(file);
                        }
                      },
                      child: Text(
                        'Upload Files',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: () {
                  _takePicture;
                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(30),
                      border: Border.all(color: Colors.red, width: 2)),
                  child: ListTile(
                    leading: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.red,
                    ),
                    title: Text(
                      'From Camera',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: TextFormField(
                controller: documentscontrollers,
                decoration: buildInputDecoration(
                    icon: Icons.edit_document, hintText: 'Enter Document Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Document Name';
                  } else if (value.length < 6) {
                    return 'Document Name must be at least 6 characters long';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            CustomElevatedButton(
                text: 'Continue',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Proceed with your logic if the form is valid
                    // For example, save the document name and uploaded files
                    String documentName = documentscontrollers.text;
                    // Then continue with your logic...
                  }
                }),
            SizedBox(height: 20),
            Container(
              color: Colors.grey[200], // Grey background color
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Uploaded Files',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  uploadedFiles.isEmpty
                      ? Center(child: Text(''))
                      : Column(
                          children: uploadedFiles.map((file) {
                            return ListTile(
                              title: Text(
                                file.path.split('/').last,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    uploadedFiles.remove(file);
                                  });
                                },
                              ),
                            );
                          }).toList(),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
