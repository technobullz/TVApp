import 'package:flutter/material.dart';
import 'package:max_supreme_flutter/controller/handle_screen_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class SeasonsScreens extends StatefulWidget {
  final int? index;

  const SeasonsScreens({super.key, this.index = 0});

  @override
  State<SeasonsScreens> createState() => _SeasonsScreensState();
}

class _SeasonsScreensState extends State<SeasonsScreens> {
  int showSelected = 0;

  List series = [
    {
      'image': "assets/images/series/claws.jpg",
      'title': "Season 1",
    },
    {
      'image': "assets/images/series/claws.jpg",
      'title': "Season 2",
    },
    {
      'image': "assets/images/series/claws.jpg",
      'title': "Season 3",
    },
    {
      'image': "assets/images/series/claws.jpg",
      'title': "Season 4",
    },
  ];

  List series1 = [
    {
      'image': "assets/images/series/fivebedroom.jpg",
      'title': "Season 1",
    },
    {
      'image': "assets/images/series/fivebedroom.jpg",
      'title': "Season 2",
    },
  ];

  List series2 = [
    {
      'image': "assets/images/series/Jett.jpg",
      'title': "Season 1",
    },
  ];

  HandleScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.changeTapped(false);
        return false;
      },
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width < 400 ? Get.width / 2.3 : Get.width / 2,
                    child: GridView.builder(
                      itemCount: widget.index == 0
                          ? series.length
                          : widget.index == 1
                              ? series1.length
                              : series2.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisExtent: 85.sp,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) => Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showSelected = index;
                              });

                              controller.changeTapped(false);

                              controller.changeTapped1(true);
                            },
                            child: Container(
                              height: 65.sp,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: showSelected == index
                                        ? Color(0xffF9E20D)
                                        : Colors.transparent,
                                    width: 1.5),
                                image: DecorationImage(
                                  image: AssetImage(
                                    widget.index == 0
                                        ? series[index]['image']
                                        : widget.index == 2
                                            ? series2[index]['image']
                                            : series1[index]['image'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Text(
                            widget.index == 0
                                ? series[index]['title']
                                : widget.index == 2
                                    ? series2[index]['title']
                                    : series1[index]['title'],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width:
                        Get.width > 800 ? Get.width * 0.05 : Get.width * 0.06,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 100.sp,
                        width: 80.sp,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              widget.index == 0
                                  ? series[showSelected]['image']
                                  : widget.index == 2
                                      ? series2[showSelected]['image']
                                      : series1[showSelected]['image'],
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Positioned(
                        bottom: -69.sp,
                        child: Container(
                          height: 70.sp,
                          width: 80.sp,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("assets/images/shadow2.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -53.sp,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.index == 0
                                    ? series[showSelected]['title']
                                    : widget.index == 2
                                        ? series2[showSelected]['title']
                                        : series1[showSelected]['title'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp),
                              ),
                              Text(
                                "2022   3h 7m ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 8.sp),
                              ),
                              SizedBox(
                                height: 3.sp,
                              ),
                              Text(
                                "Sample text type will be\nsample text type will be\ntext type will be here\ntype will be here.",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 6.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
