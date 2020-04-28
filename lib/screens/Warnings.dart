import 'dart:io';
import 'package:flutter/material.dart';
import 'package:imd_weather/widgets/Animation.dart';
import '../services/ApiCall.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;

void main() => runApp(Warnings());

class Warnings extends StatefulWidget {
  @override
  _Warnings createState() => _Warnings();
}

class _Warnings extends State<Warnings> {
  String urlDfPath = ""; //url for District forecast
  String urlRfPath = ""; //url for Regional forecast
  bool rfReady = false;
  bool dfReady = false;

  @override
  void initState() {
    fetch();
    super.initState();
  }

  void fetch() async {
    PDFData urls = new PDFData();
    await urls.getURLs();

    getFromUrl(urls.districtURL, 0).then((f) {
      setState(() {
        urlDfPath = f.path;
        //print(urlDfPath);
        rfReady = true;
      });
    });

    getFromUrl(urls.regionURL, 1).then((f) {
      setState(() {
        urlRfPath = f.path;
        //print(urlRfPath);
        dfReady = true;
      });
    });
  }

  Future<File> getFromUrl(String url, int op) async {
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file;
      switch (op) {
        case 0:
          file = File("${dir.path}/DistrictForecast.pdf"); //DF
          break;
        case 1:
          file = File("${dir.path}/RegionalForecast.pdf"); //RF
          break;
        default:
      }
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error" + e);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool flag = rfReady && dfReady ? true : false;
    return Scaffold(
      appBar: AppBar(
        title: Text("Warnings"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          flag
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 100.0),
                    ForecastButton(
                        urlDfPath: urlDfPath,
                        title: 'District Forecast & Warnings'),
                    SizedBox(height: 30.0),
                    ForecastButton(
                        urlDfPath: urlRfPath,
                        title: 'Regional Forecast & Warnings'),
                  ],
                )
              : Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }
}

class ForecastButton extends StatelessWidget {
  const ForecastButton({
    Key key,
    @required this.urlDfPath,
    this.title,
  }) : super(key: key);
  final String title;
  final String urlDfPath;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(title),
      color: Colors.lightBlueAccent,
      textColor: Colors.black,
      elevation: 5.0,
      splashColor: Colors.white,
      highlightColor: Colors.lightBlueAccent,
      onPressed: () async {
        if (urlDfPath != null) {
          await Future.delayed(Duration(milliseconds: 150));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PdfViewPage(path: urlDfPath, title: title)));
        }
      },
    );
  }
}

class PdfViewPage extends StatefulWidget {
  final String path;
  final String title;
  const PdfViewPage({
    Key key,
    @required this.title,
    @required this.path,
  }) : super(key: key);

  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;

  PDFViewController _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          FadeAnimation(
            delay: 1.5,
            child: PDFView(
              filePath: widget.path,
              autoSpacing: false,
              enableSwipe: true,
              pageSnap: true,
              onError: (e) {
                print(e);
              },
              onRender: (_pages) {
                setState(() {
                  _totalPages = _pages;
                  pdfReady = true;
                });
              },
              onViewCreated: (PDFViewController vc) {
                _pdfViewController = vc;
              },
              onPageChanged: (int page, int total) {
                setState(() {});
              },
              onPageError: (page, e) {
                print(e);
              },
            ),
          ),

          // !pdfReady
          //     ? Center(
          //         child: FutureBuilder(
          //           future: Future.delayed(Duration(seconds: 2)),
          //           builder: (context, snapshot) {
          //             return CircularProgressIndicator();
          //           },
          //         ),
          //       )
          //     : Offstage() // to check if the url is empty
        ],
      ),
    );
  }
}
