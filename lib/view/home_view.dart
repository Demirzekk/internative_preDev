import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:internative/core/components/widgets/cached_network_image_widget.dart';
import 'package:internative/core/service/service_models/get_category_model.dart/get_category_model.dart';
import 'package:internative/view/article_detail_page.dart';
import 'package:internative/view/favorite_page.dart';


import '../core/service/getservice/get_api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedItem = 1;
  final GetApiService _apiService = GetApiService();
  List<Data> data = [];
  List<BlogData> blogData= [];

  @override
  void initState() {
    _apiService.getCategory().then((value) {
      if (value != null) {
        setState(() {
          data = value.data;
        });
      } 
    });


    _apiService.getBlog("").then((value) {
 if (value != null) {
        setState(() {
          blogData = value.data!;
        });
      }  else{
        Fluttertoast.showToast(msg: "Veriler null geldi knk");
      }
    }  );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoritePage()));
            },
            icon: const Icon(Icons.search_rounded)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          "Home",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          margin: const EdgeInsets.all(6),
                          height: 90,
                          width: 165,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0)),
                          child: ImageWidget(
                            imageUrl: data[index].image.toString(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            data[index].title.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  })),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 40,
              child: Text(
                "Blog",
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              )),
          Expanded(
            flex: 5,
            child: GridView.builder(
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.all(8),
                itemCount: blogData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).orientation ==
                          Orientation.landscape
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        snapshot: blogData[index],
                                      )));
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              image:   DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    blogData[index].image.toString(),
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
                           
                            
                            child: Wrap(
                              children: [
                                ListTile(title: Text( blogData[index].title.toString())),
                              ],
                            ),
                           
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {
                              _apiService.favoriteBlog( blogData[index].id.toString());
                             
                            }, icon: const Icon(Icons.favorite)),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
