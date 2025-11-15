import 'package:hdouri/core/widgets/custom_background.dart';
import 'package:hdouri/exports.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_scan_button.dart';
import '../widgets/client_details.dart';
import '../widgets/product_list_section.dart';
import '../widgets/warranty_container.dart';
import '../widgets/warranty_produce.dart';

class TechWarrantyScreen extends StatelessWidget {
  const TechWarrantyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        appBar:CustomAppbar(title: AppStrings.warrantyCertificate),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: getPadding(horizontal: 16.0.w),
                child: Column(
                  children: [
                    35.vs,
                    const CreateWarrantyContainer(),
                    24.vs,
                    ClientDetails(),
                    24.vs,
                     ProductListSection(isMerchant: false,),
                    30.vs,
                     WarrantyProduce(),
                    40.vs,
                    CustomScanButton(
                      text: AppStrings.printWarranty,
                      icon: AppAssets.print,
                    ),
                    20.vs,
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}
