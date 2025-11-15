

import 'package:cherubini/core/widgets/custom_background.dart';

import '../../exports.dart';

class ImagesPreview extends StatefulWidget {
  const ImagesPreview({super.key});

  @override
  State<ImagesPreview> createState() => _ImagesPreviewState();
}

class _ImagesPreviewState extends State<ImagesPreview> {
  int currentIndex = 0;
  List<String> images = [];
  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    /*scrollController.addListener(
      () {
        scrollController.position.
      },
    );*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = getArguments(context);
    if (data.isNotNull) {
      images = data!['images'];
    }

    return CustomBackground(
        backgroundColor: AppColors.black,
        showBack: true,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              PositionedDirectional(
                top: 50.h,
                end: 30.w,
                child: GestureDetector(
                  onTap: () {
                    pop();
                  },
                  child: SizedBox(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.white,
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                bottom: 100.h,
                child: _buildImages(),
              ),
              Align(
                alignment: Alignment(0, 0.9),
                child: SizedBox(
                  height: 150.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // currentIndex = index;
                          //  setState(() {});
                          pageController.animateToPage(index, duration: 200.milliseconds, curve: Curves.bounceInOut);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomNetworkImage.rectangle(
                            width: 150.w,
                            radius: 10.r,
                            height: 150.h,
                            imageUrl: images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }

  _buildImages() => Align(
        alignment: AlignmentDirectional.center,
        child: SizedBox(
          height: 300.h,
          width: MediaQuery.of(context).size.width,
          child: PageView(
            controller: pageController,
            children: [
              ...List.generate(
                images.length,
                (index) => CustomNetworkImage.rectangle(
                  imageUrl: images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ],
            onPageChanged: (value) {},
          ),
        ),
      );
}
