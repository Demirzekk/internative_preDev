import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.snapshot}) : super(key: key);
  final dynamic snapshot;
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("Article Details"),
            centerTitle: true,
            backgroundColor: Colors.blueGrey.shade900,
            foregroundColor: Colors.white,
            elevation: 0,
            expandedHeight: 200,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
            ],
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
              widget.snapshot.image.toString(),
              fit: BoxFit.fill,
            )),
          ),
          SliverToBoxAdapter(
            child: ClipPath(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    visualDensity: VisualDensity.compact,
                    minVerticalPadding: 0,
                    dense: true,
                    tileColor: Colors.blueGrey.shade900,
                    leading: Text(
                      "Read this in 2 minutes",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.white54, fontSize: 13),
                    ),
                    
                  ),
                  ListTile(
                    dense: true,
                    minVerticalPadding: 10,
                    tileColor: Colors.blueGrey.shade900,
                    title: Text(
                      widget.snapshot.title.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.white, fontSize: 22),
                    ),
                   
                  ),
                  ListTile(
                    dense: true,
                    minVerticalPadding: 10,
                    tileColor: Colors.blueGrey.shade900,
                  
                    subtitle:   Text(
                      widget.snapshot.content.toString()+widget.snapshot.content.toString()+widget.snapshot.content.toString()+widget.snapshot.content.toString(),
                     softWrap: true,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                 
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
