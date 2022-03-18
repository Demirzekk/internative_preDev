import 'package:flutter/material.dart';
import 'package:internative/view/article_detail_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "My Favorites",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black),
        ),
      ),
      body: SizedBox(
          child: GridView.builder(
              clipBehavior: Clip.antiAlias,
              padding: const EdgeInsets.all(8),
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 3
                        : 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: (2 / 3),
              ),
              itemBuilder: (BuildContext context, index) {
                return Stack(
                  children: [
                    InkWell(
                      onTap: (() {
                        Navigator.of(context,rootNavigator: true).push(
                            
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      snapshot: index,
                                    )));
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://img.freepik.com/free-vector/colorful-palm-silhouettes-background_23-2148541792.jpg?size=626&ext=jpg&ga=GA1.2.2136641350.1639094400",
                                )),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(196, 201, 210, 100),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16))),
                        child: const ListTile(
                          leading: Text("data"),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.favorite)),
                    )
                  ],
                );
              })),
    );
  }
}
