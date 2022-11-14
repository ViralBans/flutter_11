import 'package:flutter/material.dart';
import 'package:flutter_11/space.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homework 11'),
      ),
      body: SafeArea(
        child: ListView(
          children: spaces
              .map(
                (space) => GestureDetector(
                  onTap: () => context.pushNamed('detail', params: <String, String>{'tag': space.id, 'description': space.description, 'image': space.image}),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 5),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Hero(
                                tag: space.id,
                                child: Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(space.image),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                color: Colors.grey,
                                height: 100,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Hero(
                                    tag: '${space.id}-title',
                                    child: Material(
                                      color: Colors.grey,
                                      child: Text(
                                        space.smallDescription,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 80,
                            right: 20,
                            child: Hero(
                              tag: '${space.id}-button',
                              child: Material(
                                elevation: 10,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  color: Colors.yellow,
                                  child: const Icon(Icons.add),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
