
import 'package:flutter/material.dart';
import 'package:playerconnect/UI/dashboard/Players/View_Profile.dart';
import 'package:playerconnect/shared/All_Data.dart';
import 'package:playerconnect/provider_data/provider_players.dart';
import 'package:playerconnect/provider_data/view_provider.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:playerconnect/shared/dialog_boxes/filter_utr_reating_dialog_box.dart';
import 'package:provider/provider.dart';

class Players extends StatefulWidget {
  const Players({Key? key}) : super(key: key);

  @override
  State<Players> createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderPlayers>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: InkWell(onTap: () {
                    provider.recommendedPlayer(context);
                  },
                    child: Text(
                      "PLAYERS",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.blue,
                          fontSize: AppFontSize.font20),
                    ),
                  ),
                  surfaceTintColor: AppColor.white,
                  backgroundColor: AppColor.white),
              body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recommended",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.black,
                                fontSize: AppFontSize.font18),
                          ),
                          SizedBox(
                            height: AppFontSize.font10,
                          ),
                          Container(
                            height: AppFontSize.font150,
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: AppFontSize.font10,
                                );
                              },
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.searchPlayerList.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(children: [
                                      CircleAvatar(
                                        // backgroundImage: NetworkImage(
                                        //     // ApiUtils.imageApi +
                                        //         provider.searchPlayerList[index].image
                                        //             .toString()
                                        // ),
                                        radius:
                                            MediaQuery.of(context).size.height /
                                                AppFontSize.font20,
                                      ),
                                      Positioned(
                                          right: 1,
                                          bottom: 6,
                                          child: CircleAvatar(
                                            radius: AppFontSize.font6,
                                            child: CircleAvatar(
                                              radius: AppFontSize.font4,
                                              backgroundColor:
                                                  AppColor.liteGreen,
                                            ),
                                          ))
                                    ]),
                                    Text(
                                      provider.searchPlayerList[index].rating.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: AppFontSize.font14,
                                          color: AppColor.black),
                                    ),
                                    Text(
                                      provider.searchPlayerList[index].firstName
                                              .toString() +" "+
                                          provider.searchPlayerList[index].lastName
                                              .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppFontSize.font16,
                                          color: AppColor.black),
                                    ),
                                    InkWell(
                                      onTap: () {

                                        Provider.of<ProviderPlayerView>(context,
                                                listen: false)
                                            .getUserProfile(
                                                context,
                                                provider.playerData[index].id
                                                    .toString());
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewProfile(),
                                            ));
                                      },
                                      child: Text(
                                        ('View Profile'),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: AppFontSize.font12,
                                            color: AppColor.blue),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          SizedBox(
                            height: AppFontSize.font10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      hintText: ('Search Players'),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Image(
                                    height: AppFontSize.font20,
                                    image: AssetImage(
                                        'assets/iconImage/filterIconImg.png')),
                              ),
                              SizedBox(
                                width: AppFontSize.font20,
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Filter();
                                      });
                                },
                                child: Image(
                                    height: AppFontSize.font30,
                                    image: AssetImage(
                                        'assets/iconImage/shortIconImg.png')),
                              ),
                            ],
                          ),
                          ListView.separated(
                            itemCount: provider.playerData.length,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Stack(children: [
                                      CircleAvatar(
                                          radius: AppFontSize.font35,
                                          backgroundImage: NetworkImage(ApiUtils
                                                  .imageApi +
                                              provider.playerData[index].images
                                                  .toString())),
                                      Positioned(
                                          right: 1,
                                          bottom: 6,
                                          child: CircleAvatar(
                                            radius: AppFontSize.font6,
                                            child: CircleAvatar(
                                              radius: AppFontSize.font4,
                                              backgroundColor:
                                                  AppColor.liteGreen,
                                            ),
                                          ))
                                    ]),
                                    Expanded(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              " ${provider.playerData[index].firstName.toString()} ${provider.playerData[index].lastName.toString()}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: AppFontSize.font16,
                                                  color: AppColor.blue),
                                            ),
                                            Text(
                                              " ${provider.playerData[index].city.toString()}   ${provider.playerData[index].rating.toString()}   ${provider.playerData[index].ratingtype == 0 ? "UTR" : "NTRP"}",
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: AppFontSize.font10,
                                                  color: AppColor.black),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Provider.of<ProviderPlayerView>(context,
                                                    listen: false)
                                                    .getUserProfile(
                                                    context,
                                                    provider.playerData[index].id
                                                        .toString());
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewProfile(),
                                                    ));
                                              },
                                              child: Text(
                                                'View Profile',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        AppFontSize.font14,
                                                    color: AppColor.blue),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    provider.playerData[index]
                                                .socialId ==
                                            null
                                        ? InkWell(
                                            onTap: () {
                                              provider.sendFriendRequest(
                                                  context,
                                                  provider.playerData[index].id,
                                                  index);
                                              setState(() {});
                                            },
                                            child: Container(
                                              width: AppFontSize.font80,
                                              height: AppFontSize.font35,
                                              decoration: BoxDecoration(
                                                  color: AppColor.skyBlue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppFontSize.font10)),
                                              child: Center(
                                                  child: Text(
                                                "Connect",
                                                style: TextStyle(
                                                    fontSize:
                                                        AppFontSize.font14,
                                                    color: AppColor.black),
                                              )),
                                            ),
                                          )
                                        : Container(
                                            width: AppFontSize.font80,
                                            height: AppFontSize.font30,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      // Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //       builder: (context) =>
                                                      //           Chat_Person(),
                                                      //     ));
                                                    },
                                                    child: Image(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            'assets/iconImage/commentIconImg.png')),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      provider
                                                          .deleteFriendRequest(
                                                              context, index);
                                                      setState(() {});
                                                    },
                                                    child: Image(
                                                        image: AssetImage(
                                                            'assets/iconImage/removeCircleIconImg.png')),
                                                  )
                                                ]),
                                          )
                                  ]);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: AppFontSize.font20,
                              );
                            },
                          )
                        ]),
                  ))),
        );
      },
    );
  }
}
