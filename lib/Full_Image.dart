// ignore_for_file: file_names, must_be_immutable
import 'package:api_calling/user_response_model.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Img extends StatefulWidget {
  Result user;

  Img(this.user, {super.key});

  @override
  State<Img> createState() => _ImgState();
}

class _ImgState extends State<Img> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.FullName),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: PhotoView(
            imageProvider: NetworkImage("${widget.user.picture?.large}"),
            minScale: PhotoViewComputedScale.contained * 1,
            initialScale: PhotoViewComputedScale.contained * 1,
            maxScale: PhotoViewComputedScale.contained * 3,
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.45,
          //   decoration: const BoxDecoration(
          //     color: Colors.green,
          //   ),
          //   child: Image(image: NetworkImage("${widget.user.picture?.large}"),fit: BoxFit.fill,),
          // ),
        ),
      ),
    );
  }
}
