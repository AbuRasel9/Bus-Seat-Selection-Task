import 'package:bus_seat_selection/data/network/network_api_services.dart';
import 'package:bus_seat_selection/models/bus_seat_selection_model/seat_item_model.dart';
import 'package:bus_seat_selection/repositories/bus_layout_repo/bus_seat_repo.dart';
import 'package:bus_seat_selection/utils/app_url.dart';

class BusSeatRepoImpl implements BusSeatRepo{
  final _apiServices=NetworkApiService();
  ///fetches the list form api
  ///return [SeatItemModel] 
  @override
  Future<SeatItemModel> busSeatApi(bool useApi1) async {
    String url=useApi1?ApiUrl.api1:ApiUrl.api2;
    final response=await _apiServices.getApi(url);
    return SeatItemModel.fromJson(response);
  }
  
 
  
}