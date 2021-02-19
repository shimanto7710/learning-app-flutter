import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {

  String lvnlist = 'lvnlist';
  String selectedLvnList = 'selectedLvnList';


  String adnlist = 'adnlist';
  String selectedAdnList = 'selectedAdnList';

  String bsnlist = 'bsnlist';
  String selectedBsnList = 'selectedBsnList';


  String shotslist = 'shotslist';
  String selectedShotsList = 'selectedShotsList';

  String name = "name";
  String number = "number";


  Future<bool> setIsLoggedIn(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('loginData', value);
  }

  Future<bool> getIsLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('loginData') ?? false;
  }


  Future<bool> setOnBoardViewed(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('OnBoardViewed', value);
  }

  Future<bool> getOnBoardViewed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('OnBoardViewed') ?? false;
  }


  //Name
  setName(String st) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(name, st);
  }

  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(name);
    return stringValue;
  }

  //number
  setNumber(String st) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(number, st);
  }

  getNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(number);
    return stringValue;
  }





  //LVN
  setLvnList(String st) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(lvnlist, st);
  }

  getLvnList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(lvnlist);
    return stringValue;
  }

  setSelectedLvnList(String st) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(selectedLvnList, st);
  }

  getSelectedLvnList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(selectedLvnList);
    return stringValue;
  }





  //ADN
  setAdnList(String st) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(adnlist, st);
  }

  getAdnList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(adnlist);
    return stringValue;
  }

  setSelectedAdnList(String st) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(selectedAdnList, st);
  }

  getSelectedAdnList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(selectedAdnList);
    return stringValue;
  }




  //BSN
  setBsnList(String st) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(bsnlist, st);
  }

  getBsnList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(bsnlist);
    return stringValue;
  }

  setSelectedBsnList(String st) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(selectedBsnList, st);
  }

  getSelectedBsnList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(selectedBsnList);
    return stringValue;
  }




  //Shots
  setShotsList(String st) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(shotslist, st);
  }

  getShotsList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(shotslist);
    return stringValue;
  }

  setSelectedShotsList(String st) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(selectedShotsList, st);
  }

  getSelectedShotsList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(selectedShotsList);
    return stringValue;
  }





}
