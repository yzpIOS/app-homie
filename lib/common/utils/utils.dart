// 初始化本地存储的方法
import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static SharedPreferences? preferences;

  // static PackageInfo packageInfo;
  static Future<bool> getInstance() async {
    preferences = await SharedPreferences.getInstance();
    return true;
  }
}

// 保存简单的数据到本地
saveState(String type, String key, value) {
  var prefs = SpUtil.preferences;
  switch (type) {
    case 'String':
      prefs?.setString(key, value);
      break;
    case 'Bool':
      prefs?.setBool(key, value);
      break;
    case 'Int':
      prefs?.setInt(key, value);
      break;
    case 'Double':
      prefs?.setDouble(key, value);
      break;
    case 'StringList':
      prefs?.setStringList(key, value);
      break;
  }
}

// 获取保存到本地的数据
// string 类型
String readStringData(key) {
  var result = SpUtil.preferences?.getString(key);
  return result ?? '';
}

// int 类型
int readIntData(key) {
  var result = SpUtil.preferences?.getInt(key);
  return result ?? 0;
}

// Double 类型
double readDoubleData(key) {
  var result = SpUtil.preferences?.getDouble(key);
  return result ?? 0.0;
}

//bool 类型
bool readBoolData(key) {
  var result = SpUtil.preferences?.getBool(key);
  return result ?? false;
}

//bool 类型
List<String> readListData(key) {
  var result = SpUtil.preferences?.getStringList(key);
  return result ?? [];
}

// 判断key是否存在
bool readKey(key) {
  return SpUtil.preferences?.containsKey(key) ?? false;
}

// 删除指定的Key
removeKey(key) {
  SpUtil.preferences?.remove(key);
}

// 删除所有的Key
clearKey() {
  SpUtil.preferences?.clear();
}
