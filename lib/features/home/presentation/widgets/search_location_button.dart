import '../../../../exports.dart';

class SearchLocationButton extends StatelessWidget {
  const SearchLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      leftIcon: CustomSVGImage(asset: AppAssets.searchLocation),
      onPressed: () {},
      text: AppStrings.searchLocation,
      width: 190,
    );
  }
}
