import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail(
      {Key,
      key,
      required this.tag,
      required this.description,
      required this.image})
      : super(key: key);
  final String tag, description, image;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          centerTitle: true,
          title: const Text('Test Detail Screen'),
          flexibleSpace: Stack(
            clipBehavior: Clip.none,
            children: [
              Hero(
                tag: widget.tag,
                child: Image(
                  height: double.infinity,
                  width: double.infinity,
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: -20,
                left: 20,
                child: Hero(
                  tag: '${widget.tag}-button',
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Material(
                      color: Colors.green,
                      child: Text(widget.tag),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 8.0, right: 8.0),
          child: Hero(
            tag: '${widget.tag}-title',
            child: Material(
              child: Text(widget.description),
            ),
          ),
        ),
      ),
    );
  }
}
