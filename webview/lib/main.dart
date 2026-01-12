import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WebView',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 33, 92, 170),
        ),
      ),
      home: const MyHomePage(title: 'Flutter WebView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            print("page started loading: $url");
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (url) {
            print("page finished loading: $url");
            setState(() {
              _isLoading = false;
            });
          },
          onNavigationRequest: (request) {
            if (request.url.startsWith("https://flutter.dev") ||
                request.url.startsWith("https://docs.flutter.dev")) {
              return NavigationDecision.navigate;
            }
            print("blocking navigation to ${request.url}");
            return NavigationDecision.prevent;
          },
        ),
      )
      // Load from URL
      ..loadRequest(Uri.parse("https://flutter.dev/"));
    // Load from asset file: 'assets/index.html'
    // ..loadFlutterAsset('assets/index.html');

    // Load from HTML string
    /*
      ..loadHtmlString('''
      <!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
      :root {
        --primary: #7ea4f2;
        --primary-light: #aac7ff;
        --bg: #f8faff;
        --text: #202124;
        --sub: #5f6368;
      }

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: -apple-system, BlinkMacSystemFont, "SF Pro Text",
          "Segoe UI", Roboto, sans-serif;
      }

      body {
        background: var(--bg);
        color: var(--text);
      }

      .header {
        background: linear-gradient(
          145deg,
          var(--primary-light),
          var(--primary)
        );
        padding: 80px 28px 90px;
        text-align: center;
        color: white;
        border-bottom-left-radius: 20px;
        border-bottom-right-radius: 20px;
      }

      .badge {
        display: inline-block;
        background: rgba(255, 255, 255, 0.3);
        padding: 6px 14px;
        border-radius: 20px;
        font-size: 0.75rem;
        font-weight: 700;
        margin-bottom: 10px;
      }

      section {
        padding: 28px;
        max-width: 600px;
        margin: auto;
      }

      .card {
        background: white;
        border-radius: 20px;
        padding: 22px;
        margin-top: 16px;
        box-shadow: 0 8px 20px rgba(170, 199, 255, 0.25);
      }

      .card strong {
        color: var(--primary);
      }

      code {
        display: block;
        margin-top: 8px;
        background: #eef3ff;
        padding: 8px 12px;
        border-radius: 10px;
        font-size: 0.85em;
        color: #2d5bbe;
      }

      .footer {
        text-align: center;
        margin-top: 32px;
        font-size: 0.8em;
        color: var(--sub);
      }
    </style>
  </head>

  <body>
    <div class="header">
      <div class="badge">HTML STRING</div>
      <h1>📱 HTML String</h1>
      <p>Loaded dynamically from Dart code</p>
    </div>

    <section>
      <div class="card">
        <strong>Source</strong>
        <code>
          From HTML string:
          loadHtmlString('&lt;html&gt;...&lt;/html&gt;')
        </code>
      </div>

      <div class="card">
        <strong>Source</strong>
        <code>
          From HTML string:
          loadHtmlString('&lt;html&gt;...&lt;/html&gt;')
        </code>
      </div>

      <div class="card">
        <strong>Source</strong>
        <code>
          From HTML string:
          loadHtmlString('&lt;html&gt;...&lt;/html&gt;')
        </code>
      </div>

      <div class="footer">
        webview_flutter • HTML String Method
      </div>
    </section>
  </body>
</html>

''');
*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("WebView Navigation & Events"),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () async {
              if (await _controller.canGoBack()) {
                _controller.goBack();
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () async {
              if (await _controller.canGoForward()) {
                _controller.goForward();
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _controller.reload();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),

          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.2),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
