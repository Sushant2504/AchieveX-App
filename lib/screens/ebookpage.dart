import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class EBookPage extends StatefulWidget {
  final String bookTitle;
  final String bookUrl;

  const EBookPage({
    super.key,
    required this.bookTitle,
    required this.bookUrl,
  });

  @override
  State<EBookPage> createState() => _EBookPageState();
}

class _EBookPageState extends State<EBookPage> {
  final Completer<PDFViewController> _pdfViewController =
      Completer<PDFViewController>();
  final StreamController<String> _pageCountController =
      StreamController<String>();
  final TextEditingController _pageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.bookTitle),
        actions: <Widget>[
          StreamBuilder<String>(
              stream: _pageCountController.stream,
              builder: (_, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[100],
                      ),
                      child: Text(snapshot.data!),
                    ),
                  );
                }
                return const SizedBox();
              }),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PDF(
              enableSwipe: true,
              swipeHorizontal: false,
              autoSpacing: false,
              pageFling: false,
              onPageChanged: (int? current, int? total) =>
                  _pageCountController.add('${current! + 1} - $total'),
              onViewCreated: (PDFViewController pdfViewController) async {
                _pdfViewController.complete(pdfViewController);
                final int currentPage =
                    await pdfViewController.getCurrentPage() ?? 0;
                final int? pageCount = await pdfViewController.getPageCount();
                _pageCountController.add('${currentPage + 1} - $pageCount');
              },
            ).fromUrl(
              widget.bookUrl,
              errorWidget: (dynamic error) => Center(
                child: Text(
                  error.toString(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _pageController,
                    decoration: const InputDecoration(
                      labelText: 'Page number',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () async {
                    final PDFViewController pdfController =
                        await _pdfViewController.future;
                    final int? pageCount = await pdfController.getPageCount();
                    final int page = int.parse(_pageController.text);
                    if (page > 0 && page <= (pageCount ?? 0)) {
                      pdfController.setPage(page - 1);
                    } else {
                      // Show some error message if the page number is invalid
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid page number'),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


 // Scaffold(
    //   appBar: AppBar(
    //     centerTitle: true,
    //     title: Text(
    //       widget.title,
    //       style: const TextStyle(
    //         fontSize: 18,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.black,
    //       ),
    //     ),
    //     backgroundColor: AppColors.accentColor,
    //     leading: IconButton(
    //       icon: const Icon(
    //         Icons.arrow_back,
    //         color: Colors.black,
    //       ),
    //       onPressed: () => Navigator.pop(context),
    //     ),
    //     shape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.only(
    //         bottomRight: Radius.circular(20),
    //         bottomLeft: Radius.circular(20),
    //       ),
    //     ),
    //   ),
    //   body: SingleChildScrollView(
    //     child: Center(
    //       child: Column(
    //         children: [
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           Image.asset(
    //             widget.image,
    //             height: MediaQuery.of(context).size.height * 0.5,
    //             fit: BoxFit.cover,
    //           ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           Container(
    //             height: MediaQuery.of(context).size.height * 0.5,
    //             width: MediaQuery.of(context).size.width * 0.77,
    //             color: Colors.grey,
    //           ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );