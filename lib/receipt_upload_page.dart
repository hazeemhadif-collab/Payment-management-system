import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ReceiptUploadPage extends StatefulWidget {
  const ReceiptUploadPage({super.key});

  @override
  State<ReceiptUploadPage> createState() =>
      _ReceiptUploadPageState();
}

class _ReceiptUploadPageState
    extends State<ReceiptUploadPage> {

  String? selectedFile;

  Future<void> pickFile() async {

    FilePickerResult? result =
    await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      setState(() {
        selectedFile =
            result.files.single.path;
      });
    }
  }

  void submitReceipt() {

    if (selectedFile == null) {

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Please choose a file.",
          ),
        ),
      );

      return;
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content: Text(
          "Receipt uploaded successfully.",
        ),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/resort pool.jpg', // Change to your image
              fit: BoxFit.cover,
            ),
          ),

          // Dark Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.25),
            ),
          ),

          // Main Content
          Column(
            children: [

              // Header
              Container(
                height: 90,
                color: const Color(0xFF0D8B94),
                child: const Center(
                  child: Text(
                    "Receipt Upload",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.95),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const Text(
                              "Upload Payment File",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 30),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: pickFile,
                                icon: const Icon(Icons.upload_file),
                                label: Text(
                                  selectedFile == null
                                      ? "Choose File"
                                      : "Choose Another File",
                                ),
                              ),
                            ),

                            const SizedBox(height: 15),

                            if (selectedFile != null)
                              Text(
                                "Selected File:\n${selectedFile!.split('/').last}",
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            const SizedBox(height: 30),

                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: submitReceipt,
                                child: const Text("Submit File"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}