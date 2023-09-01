import '../discover/view.dart';
import '../library/view.dart';
import '../store/view.dart';

class MasterController {
  int currentIndex = 0;
  var screens = const [DiscoverScreen(), LibraryScreen(), StoreScreen()];
}
