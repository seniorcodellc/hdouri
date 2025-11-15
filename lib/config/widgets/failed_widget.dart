import '../../exports.dart';

class FailedWidget extends StatelessWidget {
  const FailedWidget({super.key, this.width, this.height});
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              50.vs,
              Container(
                width: width ?? 300,
                height: height ?? 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.shade100,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.shade200,
                      blurRadius: 30,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: width != null ? width! * 0.75 : 100,
                    height: height != null ? height! * 0.75 : 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.acRed.withAlpha(100),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        color: AppColors.errorColor,
                        size: width != null ? width! * 0.20 : 100,
                      ),
                    ),
                  ),
                ),
              ),
              50.vs,
              Text(
                AppStrings.reservationFailedTitle.trans,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width.isNotNull ? 24 - width! * .01 : 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              10.vs,
              Text(
                AppStrings.reservationFailedDesc.trans,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width.isNotNull ? 16 - width! * .01 : 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
