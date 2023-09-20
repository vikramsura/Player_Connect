import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playerconnect/shared/All_Data.dart';
import 'package:playerconnect/UI/dashboard/Players/View_Profile.dart';
import 'package:playerconnect/provider_data/provider_connect.dart';
import 'package:playerconnect/provider_data/view_provider.dart';
import 'package:playerconnect/shared/constant/appColors.dart';
import 'package:playerconnect/shared/constant/font_sizes.dart';
import 'package:provider/provider.dart';


class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProviderConnect>(context, listen: false).getConnect();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderConnect>(
      builder: (context, provider, child) {
        return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                    automaticallyImplyLeading: false,
                    foregroundColor: AppColor.white,
                    title: InkWell(
                      onTap: () {
                        provider.getConnectionRequest();
                        provider.getConnect();
                      },
                      child: Text(
                        "CONNECT",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.blue,
                            fontSize: AppFontSize.font20),
                      ),
                    ),
                    actions: [
                      Image(
                          height: AppFontSize.font24,
                          image:
                              AssetImage('assets/iconImage/filterIconImg.png')),
                      SizedBox(
                        width: AppFontSize.font20,
                      )
                    ],
                    surfaceTintColor: AppColor.white,
                    backgroundColor: AppColor.white),
                body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Requests ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.black,
                                      fontSize: AppFontSize.font18),
                                ),
                                CircleAvatar(
                                  backgroundColor: AppColor.skyBlue,
                                  radius: AppFontSize.font10,
                                  child: Center(
                                    child: Text(
                                     provider.connectionRequestDataList.length.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.black,
                                          fontSize: AppFontSize.font12),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "View More",
                                  style: TextStyle(
                                      color: AppColor.skyBlue,
                                      fontSize: AppFontSize.font16),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppFontSize.font20,
                            ),
                            Container(
                              height: AppFontSize.font150,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    provider.connectionRequestDataList.length,
                                itemBuilder: (context, index) {
                                  var data = provider
                                      .connectionRequestDataList[index].sender!;
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Stack(children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              ApiUtils.imageApi +
                                                  data.images.toString()),
                                          radius: AppFontSize.font24,
                                        ),
                                        Positioned(
                                            right: -1,
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
                                        "${data.rating}  ${data.ratingtype == 0 ? "UTR" : "NTRP"}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: AppFontSize.font10,
                                            color: AppColor.black),
                                      ),
                                      Text(
                                        "${data.firstName}  ${data.lastName}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: AppFontSize.font14,
                                            color: AppColor.black),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Provider.of<ProviderPlayerView>(context,
                                              listen: false)
                                              .getUserProfile(
                                              context,
                                              data.id
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
                                              fontSize: AppFontSize.font10,
                                              color: AppColor.blue),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              provider.acptDenyFriendRequest(
                                                  context, data.id, index, 2);
                                            },
                                            child: Image(
                                                height: AppFontSize.font20,
                                                image: AssetImage(
                                                    'assets/iconImage/aceptReqIconImg.png')),
                                          ),
                                          SizedBox(
                                            width: AppFontSize.font10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              provider.acptDenyFriendRequest(
                                                  context, data.id, index, 3);
                                            },
                                            child: Image(
                                                height: AppFontSize.font24,
                                                image: AssetImage(
                                                    'assets/iconImage/removeCircleIconImg.png')),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                            Divider(
                              thickness: AppFontSize.font4,
                            ),
                            SizedBox(
                              height: AppFontSize.font10,
                            ),
                            Text(
                              'Successful Matches',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.black,
                                  fontSize: AppFontSize.font18),
                            ),
                            SizedBox(
                              height: AppFontSize.font10,
                            ),
                            ListView.separated(
                              itemCount: provider.playerConnectedData.length,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var item = provider.playerConnectedData[index]
                                    .socialId!;
                                return ListTile(
                                  leading: Stack(children: [
                                    CircleAvatar(
                                        radius: AppFontSize.font24,
                                        backgroundImage: NetworkImage(
                                            ApiUtils.imageApi +
                                                item.images.toString())),
                                    Positioned(
                                        right: 0,
                                        bottom: 6,
                                        child: CircleAvatar(
                                          radius: AppFontSize.font6,
                                          child: CircleAvatar(
                                            radius: AppFontSize.font4,
                                            backgroundColor: AppColor.liteGreen,
                                          ),
                                        )),
                                  ]),
                                  title: Text(
                                    "${item.firstName.toString()}  ${item.lastName.toString()}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: AppColor.blue),
                                  ),
                                  subtitle: Text(
                                    "${item.city.toString()}  ${item.rating.toString()}  ${item.ratingtype == 0 ? "UTR" : "NTRP"}",
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppFontSize.font10,
                                        color: AppColor.black),
                                  ),
                                  trailing: Container(
                                    height: AppFontSize.font30,
                                    width: AppFontSize.font80,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image(
                                              height: AppFontSize.font24,
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/iconImage/commentIconImg.png')),
                                          Icon(
                                            Icons.more_horiz,
                                            size: AppFontSize.font24,
                                          )
                                        ]),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: AppFontSize.font10,
                                );
                              },
                            )
                          ]),
                    ))));
      },
    );
  }
}
