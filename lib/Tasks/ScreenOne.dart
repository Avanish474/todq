import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'File Picker Example',
      home: FilePickerScreen(),
    );
  }
}
class FilePickerScreen extends StatefulWidget {
  @override
  _FilePickerScreenState createState() => _FilePickerScreenState();
}


class _FilePickerScreenState extends State<FilePickerScreen> {
  late String _directoryPath;

  Future<void> _openDirectory() async {
    try {
      _directoryPath = (await FilePicker.platform.getDirectoryPath())!;
      if (_directoryPath != null) {
        print('Selected directory: $_directoryPath');
        final files = _printFiles(Directory(_directoryPath));
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FileListScreen(files)),
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  List<String> _printFiles(Directory directory) {
    final fileList = <String>[];
    final files = directory.listSync();
    for (final file in files) {

     fileList.add('${directory.path}/${file.path.split('/').last}');
    }
    final subFolders = directory.listSync().whereType<Directory>();

    for (final subFolder in subFolders) {
      fileList.addAll(_printFiles(subFolder));
    }
    return fileList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('File Picker Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: _openDirectory,
          child: Text('Select Directory'),
        ),
      ),
    );
  }
}

class FileListScreen extends StatelessWidget {
  final List<String> files;

  FileListScreen(this.files);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('File List Screen')),
      body: ListView.builder(
        itemCount: files.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(files[index]));
        },
      ),
    );
  }
}