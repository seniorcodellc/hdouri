abstract class EndPoints {
  /* domain and sub subentitry*/
  static const String baseUrl = 'https://demo.dotstarerp.com/'; //base url
  static const String api = '/api/LoyaltyPoints/';

  ///////////////////////////// authentication ////////////////////////////
  static const String login = '${api}login';
  static const String logout = '${api}logout';
  static const String profile = '${api}profile';
  static const String technicianList = '${api}technicianList';
  static const String approved = '${api}approved';
  static const String suspend = '${api}suspend';
  static const String unSuspend = '${api}unSuspend';

  static const String registerMerchant = '${api}registerMerchant';
  static const String history = '${api}readingHistory';
  static const String registerTech = '${api}registerTechnician';
  static const String governorate = '${api}governorate';
  static const String merchantList = '${api}merchantsList';
  static const String paymentGateways = '${api}payments/payment-gateways';
  static const String verify = 'User_Activate';
  static const String reSend = '${api}resend-code';
  static const String changePhone = '${api}change-phone';
  static const String getBrokers = '${api}users';
  static const String dateConfig = '${api}user/config';
  static const String brokers = '${api}select/roles';
  static const String verifyForgetPassword = '${api}verify/reset-password';
  static const String forgetPassword = '${api}forgot-password';
  static const String resetPassword = '${api}reset-password';
  static const String userLogout = '${api}logout';
  static const String bookProperty = '${api}property/book';
  static const String bookBidding = '${api}property/book_bidding';
  static const String notification = '${api}user/notification';
  static const String transactions = '${api}payments/transactions';
  static const String cancelBook = '${api}user/bookings/cancel';
  static const String addToWallet = '${api}payments/add_to_wallet';
  static const String withdrawRequest = '${api}payments/withdraw_request';
  static const String unReadNotification =
      '${api}user/notification/unread-count';
  static const String readNotifications = '${api}user/notification/read';
  static const String confirmationCode = '${api}send_sms';
  ///////////////////////////// home ////////////////////////////
  static const String properties = '${api}home/properties';
  static const String procurationForiegn = '${api}procuration_foriegn';
  static const String featuredProperties = '${api}home/featured-properties';
  static const String showProperties = '${api}properties';
  static const String config = '${api}select/configuration';
  static const String getFavorites = '${api}favourites';
  static const String getMyAuction = '${api}user/bookings/winning-losing';
  // static const String profile = '${api}user';
  static const String bookings = '${api}user/bookings/index';
  static const String faq = '${api}faq';
  static const String settings = '${api}settings';
  static const String howWeWork = '${api}how-we-work';
  static const String verifyIdentity = 'User_Activate';

  static const String estateAd = '${api}estate/ad';
  static const String getDistrict = '${api}districts';
  static const String getAgent = '${api}agents';
  static const String getOrderNumber = '${api}booked_property_not_ended';
  static const String addForeignDelegation = '${api}foreign-delegation';
  static const String addProcuration = '${api}procuration';
  static const String getBankName = '${api}';
  static const String banks = '${api}banks';
  static const String messages = '${api}messages';
  static const String districts = '${api}districts';
  static const String getCancelReason = '${api}getCancelReason';
  static const String estateRequest = '${api}estate/request';
  static const String completeDeal = '${api}estate/ad/complete-deal';
  static const String completeOrderDeal = '${api}estate/request/complete-deal';
  static const String cities = '${api}select/cities/';
  static const String communicationTool = '${api}select/communication-tool';
  static const String termsAndCondition = '${api}terms-and-condisitons';
  static const String aboutmazadat = '${api}about-us';
  static const String mazadatValLicense = '${api}val-license';
  static const String areas = '${api}select/areas';
  static const String rooms = '${api}select/rooms';
  static const String estateType = '${api}select/estate-types';
  static const String extraDetails = '${api}select/extra-details';
  static const String canceledEstateAd = '${api}estate/canceled/ad';
  static const String myOrder = '${api}estate/request';
  static const String chat = '${api}chats';
  static const String getUserChat = '${api}chats/user/';

  static const String estateRequests = '${api}estate/request';
  static const String canceledEstateOrder = '${api}estate/canceled/requests';

  static const String estateMarket = '${api}estate/market';

  ///////////////////////////// setting ////////////////////////////

  static const String deleteAccount = '${api}user';
  static const String subscriptions = '${api}package';
  static const String subscriptionsEnroll = '${api}user/subscription-enroll';
  static const String subscriptionsPay = '${api}user/subscription-pay';
  static const String myProfile = '${api}setting';

  /// ************************   google apis *********************************
  static const String googleMapsBaseUrl =
      'https://maps.googleapis.com/maps/api/';
  static const String autoCompleteApi = 'place/autocomplete/json';
  static const String addressInfo = 'place/details/json';
  static const String direction = 'directions/json';
  static const String citiesEndPoint = 'geocode/json';
  static const String geocodeApi = 'geocode/json';
  static const String googleDirectionApi = 'directions/json';

  static var adAnnouncementToFavorite = '${api}favourites/add';
  static var addEstateRequestToFavorite = '$estateRequest/favorite';

  static var myRequests = '${api}estate/user/requests';
  static const String myAds = '${api}estate/user/ad';
  static const String myDeals = '${api}user/complete/deals';
  static const String contractOrder = '${api}estate/rent-contract';
  static const String myContractOrders = '${api}estate/user/rent-contract';

  static var payForAd = '${estateAd}/pay';
  static var payForContract = '$contractOrder/pay';
  static var payForMarket = '$estateMarket/pay';

  static var district = '${api}select/districts';

  static var removeAdMedia = "$estateAd/delete/media";
  static var removeRequestMedia = "$estateRequest/delete/media";

  static var estateMarketAll = '$estateMarket/all/home';

  static var brokerCompletedDeals = '$api/user/complete/deals/';
  static var repostOrderRequest = '$estateRequest/repost';
  static var repostEstate = '$estateAd/repost';

  static String userAndToken = "DefToken";

  static String clinicCategories = "GetClinicList";

  static var imageBaseUrl = "${baseUrl}Contents/IMG/";
  static var allDoctors = "${baseUrl}GetDoctorList";
  static var allDoctorsByClinic = "${baseUrl}GetDoctorListByClinic";
  static var allDoctorsByClinicAndDate =
      "${baseUrl}GetDoctorListByClinicAndDate";
  static var allDoctorsSearch = "${baseUrl}DoctorSearch";

  static String companies = "GetCompanyList";

  static String insurancePolicy = "GetPolicyLis";
}
