import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:internative/core/components/widgets/bottom_tabbar.dart';

import 'package:internative/core/components/widgets/custom_login_buttons.dart';
import 'package:internative/core/service/getservice/get_api_service.dart';
import 'package:internative/core/service/service_models/get_user_account.dart/get_user_account.dart';
 
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
final GetApiService _apiService =GetApiService();
AccountData  userAccountData = AccountData();
  @override
  void initState() {
   _apiService.getUserAccountData().then((value){
      if (value != null) {
        setState(() {
          userAccountData = value.data! ;
        });
      } 
   }  
   ).catchError((onError){print("Hata ile karşılaşıldı: $onError");});
    super.initState();
  } final CustomAuthButton _customAuthButton = CustomAuthButton();
  @override
  Widget build(BuildContext context) {
    String? src ="https://img.freepik.com/free-vector/colorful-palm-silhouettes-background_23-2148541792.jpg?size=626&ext=jpg&ga=GA1.2.2136641350.1639094400";
 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Provider.of<BottomTabbarWidget>(context, listen: false)
                  .selectedItem = 1;
            }),
        title: Text(
          userAccountData.id.toString(),
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 175,
              width: 175,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://img.freepik.com/free-vector/colorful-palm-silhouettes-background_23-2148541792.jpg?size=626&ext=jpg&ga=GA1.2.2136641350.1639094400",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Align(
                      alignment: const Alignment(0.7, 0.8),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: 30,
                          )))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              height: 175,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(16)),
            ),
            const SizedBox(
              height: 22,
            ),
            _customAuthButton.customAuthButton(
                buttonTitle: "Save",
                buttonTitleColor: Colors.black,
                buttonPrefixIcon: const Icon(Icons.logout),
                buttonBackgroundColor: Colors.white,
                onPressed: () {},
                context: context),
            const SizedBox(
              height: 12,
            ),
            _customAuthButton.customAuthButton(
                buttonTitle: "Log Out",
                buttonTitleColor: Colors.black,
                buttonPrefixIcon: const Icon(Icons.login),
                buttonBackgroundColor: Colors.white,
                onPressed: () {
                  showModalBottomSheet<dynamic>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                      ),
                      clipBehavior: Clip.antiAlias,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 1.5,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blueGrey.shade900,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(src))),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(16),
                                                        ),
                                                      ),
                                                      content: const Text(
                                                        "Select a Picture",
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      actions: [
                                                        _customAuthButton
                                                            .customAuthButton(
                                                                buttonTitle:
                                                                    "Camera",
                                                                buttonTitleColor:
                                                                    Colors
                                                                        .white,
                                                                buttonPrefixIcon:
                                                                    const Icon(
                                                                  Icons
                                                                      .camera_alt,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                buttonBackgroundColor:
                                                                    Colors
                                                                        .blueGrey
                                                                        .shade900,
                                                                onPressed:
                                                                    () {},
                                                                context:
                                                                    context),
                                                        const SizedBox(
                                                          height: 12,
                                                        ),
                                                        _customAuthButton
                                                            .customAuthButton(
                                                                buttonTitle:
                                                                    "Gallery",
                                                                buttonTitleColor:
                                                                    Colors
                                                                        .black,
                                                                buttonPrefixIcon:
                                                                    const Icon(
                                                                  Icons
                                                                      .photo_library_outlined,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                                buttonBackgroundColor:
                                                                    Colors
                                                                        .white,
                                                                onPressed:
                                                                    () {},
                                                                context:
                                                                    context),
                                                      ],
                                                    );
                                                  });
                                            },
                                            icon: const Icon(
                                              Icons.camera_alt,
                                              size: 40,
                                              color: Color.fromRGBO(
                                                  41, 47, 59, 50),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: _customAuthButton
                                              .customAuthButton(
                                                  buttonTitle: "Select",
                                                  buttonTitleColor:
                                                      Colors.white,
                                                  buttonPrefixIcon:
                                                      const Icon(Icons.login),
                                                  buttonBackgroundColor:
                                                      Colors.blueGrey.shade900,
                                                  onPressed: () {},
                                                  context: context)),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                          child: _customAuthButton
                                              .customAuthButton(
                                                  buttonTitle: "Remove",
                                                  buttonTitleColor:
                                                      Colors.black,
                                                  buttonPrefixIcon:
                                                      const Icon(Icons.login),
                                                  buttonBackgroundColor:
                                                      Colors.white,
                                                  onPressed: () {},
                                                  context: context)),
                                    ],
                                  ),
                                  const Expanded(
                                      flex: 1, child: SizedBox.shrink())
                                ]),
                          ),
                        );
                      });
                },
                context: context),
          ],
        ),
      ),
    );
  }
}
