import 'dart:io';

import 'package:dio/dio.dart';  //パッケージ読み込み
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}

// class PixabayPage extends StatefulWidget {
//   const PixabayPage({Key? key}) : super(key: key);

//   @override
//   State<PixabayPage> createState() => _PixabayPageState();
// }

// class _PixabayPageState extends State<PixabayPage> {

//   //初期値　空のリスト
//   List<PixabayImage> pixabayImages = [];

//     //WebAPIを通して画像を取得する関数
//     Future <void> fetchImages(String text) async{
//       //finalはconst 的なもの。再代入できなくなる(型情報も省略できる)
//       final Response response = await Dio().get(
//         'https://pixabay.com/api',
//         queryParameters: {
//           'key': '28025877-46d0c1cef02e11b78e4c5186c',
//           'q': text,
//           'image_type': 'photo',
//           'per_page': 100,
//         },
//         );
//       final List hits = response.data['hits'];
//       pixabayImages = hits.map(
//         (e) {
//         return PixabayImage.fromMap(e);
//       },
//       )
//       .toList();
//       //リロード
//       setState(() {});
//     }

//     //画像シェア機能関数
//     Future <void> shareImage(String url)async{
//       //1, URLから画像をダウンロード
//       final Response response = await Dio().get(url, //bytsデータ
//         options: Options(responseType: ResponseType.bytes),
//       );

//       //2,ダウンロードしたデータをファイルに保存
//       //getTemporaryDirectoryで一時保存できるファイルのパスを取得できる 一時的に保存
//       final Directory dir = await getTemporaryDirectory();
//       // ~~/image.pngというファイルに、response.dataを書き出して、file(File型)という変数に代入
//       final File file = await File(dir.path + '/image.png').writeAsBytes(response.data);

//       //3,shareパッケージを呼び出して共有 このパッケージだけでシェア機能をつけることができる
//       Share.shareFiles([file.path]);
//     }

//     @override
//   void initState() {
//     super.initState();
//     //最初に一度だけ呼ばれる 今回は初期値を入れている
//     fetchImages('花');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextFormField(
//           //テキスト欄の初期値
//           initialValue: '花',
//           //TextFormFieldのCSS
//           decoration: const InputDecoration(
//             fillColor: Colors.white,
//             filled: true,
//           ),
//           //入力された際の挙動
//           onFieldSubmitted: (text){
//             fetchImages(text);
//           },
//         ),
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//         //for文のiのようなもの hitsの要素数が入る
//         itemCount: pixabayImages.length,
//         //list内の要素数は20 なので indexには、0~19までの数値が入る
//         itemBuilder: (context, index){
//           final pixabayImage = pixabayImages[index];
//           return InkWell(
//             onTap: () async {
//               shareImage(pixabayImage.webformatURL);
//             },
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 Image.network(
//                   pixabayImage.previewURL,
//                   fit: BoxFit.cover,
//                   ),
          
//                 Align(
//                   //数字を右下に表示
//                   alignment: Alignment.bottomRight,
//                   child: Container(
//                     color: Colors.white,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         const Icon(Icons.thumb_up_off_alt_outlined,
//                         size: 16,
//                         ),
//                         Text('${pixabayImage.likes}'),
//                       ],
//                     )),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// //クラスの作成     class クラス名{}
// class PixabayImage {
//   //型と変数名を決める

//   final String webformatURL;
//   final String previewURL;
//   final int likes;

//   //コンストラクター(インスタンスを作る為の関数)
//   PixabayImage({
//     required this.webformatURL,
//     required this.previewURL,
//     required this.likes,
//   });
//           //変数名               型                  引数名
//   factory PixabayImage.fromMap(Map<String, dynamic> map){
//     //コンストラクターの呼び出し
//     return PixabayImage(webformatURL: map['webformatURL'],
//      previewURL: map['previewURL'],
//       likes: map['likes'],
//       );
//   }
// }

//final pixabayImage = PixabayImage(webformatURL: webformatURL, previewURL: previewURL, likes: likes,);