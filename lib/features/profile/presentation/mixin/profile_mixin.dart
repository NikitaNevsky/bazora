import "package:bazora/features/api/auth/supabase_auth/auth_util.dart";
import "package:bazora/features/api/supabase/database/database.dart";
import "package:bazora/features/profile/presentation/my_profile_page.dart";
import "package:bazora/router/app_routes.dart";
import "package:flutter/cupertino.dart";
import "package:intl/intl.dart";

mixin ProfileMixin on State<MyProfilePage> {


  late Future<List<FavoriteProductsViewCatalogRow>> futureFavorite;
  List<UsersRow>? users;

  @override
  void initState() {
    super.initState();
    futureFavorite = fetchFavorite();
    getUser();
  }

  Future<void> getUser() async {
    final DateFormat formatter = DateFormat('dd.MM.yyyy');
    users = await UsersTable().queryRows(
      queryFn: (q) => q.eqOrNull(
        'phone',
        localSource.getMyPhoneNumber?.replaceAll(" ", "").replaceFirst("+", ""),
      ),
    );
    print('RP ${localSource.getMyPhoneNumber?.replaceAll(" ", "").replaceFirst("+", "")}');

    if (users?.isNotEmpty ?? false) {
      localSource.setMyUserId(users?[0].id ?? "");
      localSource.setMyImageURL(users?[0].photoUrl ?? "");
      localSource.setFirstName(users?[0].name ?? "");
      localSource.setLastName(users?[0].surname ?? "");
      localSource.setMyCashBack(users?[0].totalCashback ?? 0);
      localSource.setMyReferralCode(users?[0].referralCode ?? '');
      localSource.setBirhtDay(users![0].birthday == null ? "" : formatter.format(users![0].birthday!));
    }
  }

  Future<List<FavoriteProductsViewCatalogRow>> fetchFavorite() async {
    return FavoriteProductsViewCatalogTable().queryRows(
      queryFn: (q) => q.eqOrNull(
        'is_favorite',
        true,
      ).eqOrNull(
        'user_id',
        currentUserUid,
      ),
    );
  }

  void getFavorites() {
    futureFavorite.ignore();
    setState(() {
      print('DDDD');
      futureFavorite = fetchFavorite();
    });
  }


}
