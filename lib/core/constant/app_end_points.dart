class AppEndpoints {
  static const String socketConnectUrl = 'https://haya.taxi';
  static const String loginUrl = 'captain/auth';
  static const String checkOtpUrl = 'captain/check-otp';
  static const String fillRequiredDataUrl = 'captain';
  static const String updateDocumentsData = 'captain/documents';
  static const String updateCarMedia = 'captain/vehicle/media';
  static const String carData = "captain/vehicle";
  static const String logOut = "captain/logout";
  static const String getProfileData = "captain";
  static const String getWallet = "transaction/user";
  static const String chargeWallet = "payment/zain-cash";
  static const String updateProfileImage = "captain/update/profile";
  static String cancelTrip(String tripId) => "trip/$tripId/cancel";
  static String acceptTrip(String tripId) => "trip/$tripId/accept";
  static String arrivedTrip(String tripId) => "trip/$tripId/captain-arrive";
  static String startTrip(String tripId) => "trip/$tripId/start";
  static String endTrip(String tripId) => "trip/$tripId/end";
  static const String updateCaptainProfileData = "/captain/update";
  static const String getTicketsReason = "ticket/resons";
  static const String getMyTickets = "ticket/my-tickets";
  static const String getMyRider = "trip/trip-list/captain";
  static const String createTicket = "ticket";
  static const String chargeWalletZainCash = "payment/zain-cash";
  static const String chargeWalletScratchCard = "transaction/recharge-card/charge";
}