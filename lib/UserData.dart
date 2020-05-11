class UserData {
  final String uid;
  final int hunger;
  final double money;
  final List zhistory;
  final List zbest;
  final String username;

  UserData({this.uid,this.hunger,this.money,this.zhistory, this.zbest, this.username});
}



class Check{
  checkMoney(double mon){
    if (mon < 2)  {
       return true;
     }else {
      return false;
    }
  }
  checkHunger(int hun){
    if (hun < 2)  {
      return true;
    }else{
      return false;
    }
  }
}